// 你可以在文件名包含 "PDF" 的文件中编写正常的 PDF 文档
// 这些文件会被自动编译为 PDF 文件，然后你就可以通过链接在访问
// 注意：目标是 PDF 的 Typst 文件中不能使用 `#show: template` 和来自 `tufted` 的命令
// 同时网页样式与 PDF 样式无关，你应该在 PDF 文件中自行控制 PDF 的样式效果

#set page(height: auto)
#show link: it => underline(it)

= YellowPeach: #text(weight: "regular", size: 0.9em)[Computer Science Student, Harbin Institute of Technology]

GitHub: #link("https://github.com/turturturturtur")[github.com/turturturturtur]
#h(2em)
Blog: #link("https://blog.ntlhit.top")[blog.ntlhit.top]
#h(2em)
Location: China

Computer science student at Harbin Institute of Technology, writing under the public names _YellowPeach_ and _一个普通的黄桃_. Current interests include model compression, distillation, multimodal learning, video understanding, AI systems, and cybersecurity. I value engineering-driven research: clear setup, reproducible workflows, and technical notes that help others avoid avoidable friction.

== Education

- *Harbin Institute of Technology (HIT)*, Computer Science. Integrated B.S./M.S./Ph.D. track, ongoing.
- *Beijing No. 4 High School*. Prior education before entering HIT.

== Research Interests

- Model compression and distillation.
- Multimodal learning and video understanding.
- AI systems, developer tooling, and practical infrastructure for experimentation.
- Cybersecurity, especially as a future research direction.

== Projects and Writing

- *Personal technical blog*: #link("https://github.com/turturturturtur/blog.github.io")[turturturturtur/blog.github.io]. Maintains a public GitHub Pages site at #link("https://blog.ntlhit.top")[blog.ntlhit.top], with archive, category, tag, search, image, and custom-domain support.
- *C/C++ development environment guide*: #link("https://blog.ntlhit.top/2024/06/03/c++%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83%E6%8C%87%E5%8D%97/")[vscode配置c/c++开发环境指南], published on June 3, 2024. A practical Chinese tutorial for configuring VS Code, MinGW g++, environment variables, C/C++ extensions, Code Runner, GDB debugging, and workspace-level `.vscode` files.
- *Static-site publishing workflow*: Uses GitHub, GitHub Pages, Hexo-generated static output, a custom `CNAME`, local search XML, and article-local screenshots to publish technical notes.

== Technical Skills

- *Languages and fundamentals*: C/C++, basic Python workflow awareness, computer science fundamentals.
- *Developer tooling*: VS Code, MinGW g++, GDB, Code Runner, C/C++ extension setup, environment-variable configuration.
- *Web and publishing*: Git, GitHub, GitHub Pages, Hexo static-site output, HTML/CSS/JavaScript assets, local search metadata.
- *Research toolkit interests*: compression, distillation, multimodal models, video understanding, and engineering-oriented experimentation.

== Selected Public Links

- GitHub profile: #link("https://github.com/turturturturtur")[https://github.com/turturturturtur]
- Public blog: #link("https://blog.ntlhit.top")[https://blog.ntlhit.top]
- Blog repository: #link("https://github.com/turturturturtur/blog.github.io")[https://github.com/turturturturtur/blog.github.io]
