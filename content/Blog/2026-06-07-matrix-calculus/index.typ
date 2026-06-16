#import "../index.typ": template, tufted
#show: template.with(
 title: "Matrix Calculus via Trace Techniques and MLP Backpropagation",
 description: "A self-contained derivation of matrix derivatives using trace tricks, applied to the full backward pass of a multi-layer perceptron.",
 date: datetime(year:2026, month:6, day:7),
 lang: "en",
 extra-info: [Math · Matrix Calculus],
)

= Matrix Calculus via Trace Techniques and MLP Backpropagation

Matrix derivatives show up everywhere in optimization and deep learning, but the notation is often messy. This note keeps things concrete: we start from trace properties, build up a small set of derivative rules, and then apply them to derive the backward pass of a multi-layer perceptron (MLP) end to end.

== Trace: The Workhorse

The trace of a square matrix is the sum of its diagonal entries: $op("tr")(A) = sum_i A_(i i)$. Its power for matrix calculus comes from three facts.

#text(size:11pt)[
 *Linearity.* $op("tr")(alpha A + beta B) = alpha op("tr")(A) + beta op("tr")(B)$ for scalars $alpha, beta$.

 *Cyclic invariance.* $op("tr")(A B) = op("tr")(B A)$ whenever the products are well-defined square matrices. More generally, $op("tr")(A B C) = op("tr")(B C A) = op("tr")(C A B)$. Any cyclic shift of the product is fine.

 *Scalar-as-trace.* For any scalar $s$, $s = op("tr")(s)$, which sounds trivial but lets us rewrite scalar-valued functions in trace form and then differentiate through the trace.
]

These three facts let us turn most matrix derivative problems into straightforward trace manipulations.

=== A note on layout convention

We use the _denominator layout_: $partial f \/ partial X$ has the same shape as $X^top$ when $f$ is scalar-valued. In practice this means $partial f \/ partial X_(i j)$ lives at position $(j, i)$ in the resulting matrix, which matches what most autodiff frameworks produce. All formulas below are consistent with this convention.

== Core Derivative Rules

Let $X$ be a matrix variable and let $A, B, C$ be constant matrices (independent of $X$). All the rules below follow from expanding the trace, applying linearity and the cyclic property, and reading off the coefficient.

#text(size:11pt)[
 + $partial \/ partial X op("tr")(A X) = A^top$

 + $partial \/ partial X op("tr")(X A) = A^top$

 + $partial \/ partial X op("tr")(X^top A) = A$

 + $partial \/ partial X op("tr")(X A X^top B) = B^top X A^top + B X A$

 + $partial \/ partial X op("tr")(A X B X^top) = A^top X B^top + A X B$ (check layout convention when using)
]

The first rule is the one you reach for most often. If a loss can be written as $op("tr")(C X)$ for some expression $C$ that does not contain $X$, the derivative is $C^top$.

=== Worked example: linear least squares

Consider $L =1\/2 norm(A X - B)_F^2$, where $A$ is $m times n$, $X$ is $n times p$, and $B$ is $m times p$. Rewrite in trace form:

$
L =1\/2 op("tr")((A X - B)^top (A X - B))
 =1\/2 op("tr")(X^top A^top A X) - op("tr")(X^top A^top B) +1\/2 op("tr")(B^top B)
$

Differentiating term by term with the rules above:

$
partial L \/ partial X = A^top A X - A^top B
$

Setting to zero recovers the normal equations $A^top A X = A^top B$. The trace approach avoids summing over individual entries and keeps the derivation compact.

== MLP Setup

Consider an $L$-layer MLP. For layer $l in {1, dots, L}$:

$
Z^((l)) = W^((l)) A^((l-1)) + b^((l)) , quad
A^((l)) = sigma^((l))(Z^((l)))
$

where $A^((0)) = X$ (the input), $A^((L)) = hat(y)$ (the output), and $sigma^((l))$ is an elementwise activation. Weights $W^((l)) in RR^(d_l × d_(l-1))$ and biases $b^((l)) in RR^(d_l ×1)$.

For a single training example with label $y$, define scalar loss $cal(L)(hat(y), y)$.

== The Backward Pass

Define the _local gradient_ at layer $l$ as

$
delta^((l)) = partial cal(L) \/ partial Z^((l))
$

which has the same shape as $Z^((l))$, i.e. $d_l times 1$. We compute it recursively from the top down.

=== Output layer

$
delta^((L)) = partial cal(L) \/ partial Z^((L))
 = partial cal(L) \/ partial A^((L)) \odot sigma^((L)prime)(Z^((L)))
$

where $\odot$ is elementwise multiplication and $sigma^((L)prime)$ is the derivative of the activation applied elementwise. This is straight from the scalar chain rule applied per element; writing $A^((L)) = sigma^((L))(Z^((L)))$ elementwise gives the Hadamard product form.

=== Hidden layers

For layer $l < L$, we need $partial cal(L) \/ partial Z^((l))$. The loss depends on $Z^((l))$ only through $A^((l))$, which feeds into $Z^((l+1))$. Write the chain rule in trace form to keep dimensions clear.

First, express the contribution through one output unit $k$ of layer $l+1$:

$
Z_k^((l+1)) = sum_j W_(k j)^((l+1)) sigma_j^((l))(Z^((l))) + b_k^((l+1))
$

The total differential of the loss with respect to $Z^((l))$ is

$
d cal(L) = op("tr")((partial cal(L) \/ partial Z^((l+1)))^top d Z^((l+1)))
$

Since $d Z^((l+1)) = W^((l+1)) (sigma^((l)prime)(Z^((l))) \odot d Z^((l)))$, and using the cyclic property of the trace:

$
d cal(L) = op("tr")((delta^((l+1)))^top W^((l+1)) op("diag")(sigma^((l)prime)(Z^((l)))) d Z^((l)))
$

Reading off the coefficient of $d Z^((l))$:

$
delta^((l)) = (W^((l+1)))^top delta^((l+1)) \odot sigma^((l)prime)(Z^((l)))
$

This is the classic backpropagation recurrence. The trace method makes it a one-liner rather than a mess of index sums.

=== Weight gradients

With all $delta^((l))$ in hand, the weight and bias gradients follow mechanically. Write $Z^((l)) = W^((l)) A^((l-1)) + b^((l))$ and isolate the term involving $W^((l))$:

$
d cal(L) = op("tr")((delta^((l)))^top d W^((l)) A^((l-1)))
 = op("tr")(A^((l-1)) (delta^((l)))^top d W^((l)))
$

Therefore

$
partial cal(L) \/ partial W^((l)) = delta^((l)) (A^((l-1)))^top
$

For the bias:

$
partial cal(L) \/ partial b^((l)) = delta^((l))
$

=== Summary of the backward pass

Given a single example $(x, y)$:

#text(size:11pt)[
1. *Forward.* Compute $Z^((l)), A^((l))$ for $l =1, dots, L$, caching all intermediate activations.

2. *Output delta.* $delta^((L)) = nabla_(A^((L))) cal(L) \odot sigma^((L)prime)(Z^((L)))$.

3. *Backward recurrence.* For $l = L-1, dots,1$:
 $ delta^((l)) = (W^((l+1)))^top delta^((l+1)) \odot sigma^((l)prime)(Z^((l))) $

4. *Gradients.* For each $l$:
 $ partial cal(L) \/ partial W^((l)) = delta^((l)) (A^((l-1)))^top, quad partial cal(L) \/ partial b^((l)) = delta^((l)) $
]

For a mini-batch of $m$ examples, stack activations as columns of matrices $Z^((l)) in RR^(d_l times m)$ and $A^((l)) in RR^(d_l times m)$. The formulas stay essentially identical, with the weight gradient becoming $1\/m$ of the sum over the batch.

== Concrete Example: Two-Layer MLP with MSE Loss

To make this fully concrete, let $L =2$, activation $sigma = op("ReLU")$ at the hidden layer and identity at the output, with mean squared error loss:

$
cal(L) =1\/2 norm(hat(y) - y)^2
$

Forward pass:

$
Z^((1)) = W^((1)) x + b^((1)), quad A^((1)) = op("ReLU")(Z^((1)))
$
$
hat(y) = W^((2)) A^((1)) + b^((2))
$

Output delta (using identity output activation, so $sigma^((2)prime) =1$):

$
delta^((2)) = hat(y) - y
$

Hidden delta:

$
delta^((1)) = (W^((2)))^top (hat(y) - y) \odot bb(1)[Z^((1)) >0]
$

where $bb(1)[Z^((1)) >0]$ is the indicator (ReLU derivative), applied elementwise.

Gradients:

$
partial cal(L) \/ partial W^((2)) = (hat(y) - y) (A^((1)))^top, quad
partial cal(L) \/ partial b^((2)) = hat(y) - y
$
$
partial cal(L) \/ partial W^((1)) = delta^((1)) x^top, quad
partial cal(L) \/ partial b^((1)) = delta^((1))
$

== Why the Trace Approach?

Two reasons to prefer trace-based derivations over elementwise expansions:

#text(size:11pt)[
 *Compactness.* The cyclic property collapses long index sums into a single trace manipulation. A derivation that takes half a page with index notation often fits in three lines with traces.

 *Shape checking.* Every intermediate expression has a clear matrix shape. If you end up with $partial cal(L) \/ partial W$ that doesn't match $W$'s shape, you know something went wrong. Trace derivations make shape mismatches obvious.
]

The trace method is not just a trick---it is the natural language for matrix calculus when the objective is scalar-valued, which covers essentially all of supervised learning.

== References and Further Reading

The trace-based approach to matrix derivatives is treated systematically in the Matrix Cookbook @petersen2008matrix and in Magnus and Neudecker's _Matrix Differential Calculus_ @magnus2019matrix. The backpropagation derivation via traces follows the same structure as the original Rumelhart--Hinton--Williams paper @rumelhart1986learning but keeps everything in matrix form.

#bibliography("refs.bib")
