#set page(margin: (x: 2cm, y: 1.5cm))
#set text(size: 9pt, font: "Raleway")
#set par(justify: true, first-line-indent: 0pt)

#let nf(icon) = text(font: "Symbols Nerd Font Mono", icon)

#let icon(sym, size: 12pt, content) = {
  box(
    fill: black,
    width: size + 6pt,
    height: size + 6pt,
    baseline: 20%,
    {
      v(-0.25em)
      align(center + horizon, text(fill: white, size: size)[#nf(sym)])
    }
  )
  h(0.2cm)
  content
}

#let iconrow(sym, content) = grid(
  columns: (18pt + 0.2cm, 1fr),
  icon(sym)[],
  align(horizon)[#content]
)

#let entry(dates, title, company, description) = {
  grid(
    columns: (15%, 85%),
    align(left)[#text(size: 8pt)[#dates]],
    [
      #text(weight: "bold")[#title] #h(1fr) #text(weight: "bold", size: 8pt)[#company]\
      #description
    ]
  )
  v(0.2em)
}

#let blackbox(content, size: 8pt, inset: (x: 4pt, y: 2pt)) = box(
  fill: black,
  inset: inset,
  text(fill: white, weight: "bold", size: size)[#content]
)

#let cvsect(title) = {
  v(0.1em)
  blackbox(size: 11pt)[#upper(title)]
  linebreak()
  v(-0.1em)
}

#let slashsep = h(2mm) + "/" + h(2mm)

#let techs(..items) = {
    v(-0.5em)
    align(center, items.pos().map(t => raw(t)).join(slashsep))
    v(-0.5em)
}

#let Cpp = [C#text(baseline: -0.1em, size: 0.9em)[++]]

#let mycode(url) = super(link(url, text(size: 6pt)[#nf("\u{f126}")]))

#let name-spacing = -1em

// Header
#grid(
  columns: (45%, 29%, 26%),
  [
    #let prokopenko = blackbox([PROKOPENKO], size: 28pt, inset: 4pt)
    #blackbox([KIRA], size: 28pt, inset: 4pt)
    #v(name-spacing)
    #context {
      let w = measure(prokopenko).width
      box(width: w)[
        #prokopenko
        #place(right, dy: 0.3em)[#text(size: 8pt)[she/her]]
      ]
    }
    #v(-0.3em)
    #text(size: 16pt)[Compiler Engineer]
  ],
  {
    set block(spacing: 0.2em)
    link("mailto:kp2pml30@gmail.com", iconrow("\u{f0e0}", [kp2pml30\@gmail.com]))
    link("https://linkedin.com/in/kp2pml30", iconrow("\u{f08c}", [linkedin.com/in/kp2pml30]))
    link("tel:818084706253", iconrow("\u{f095}", [+81 80 8470 6253]))
  },
  {
    set block(spacing: 0.2em)
    link("https://github.com/kp2pml30", iconrow("\u{f09b}", [github.com/kp2pml30]))
    link("https://gitee.com/kprokopenko", iconrow("\u{f1d3}", [gitee.com/kprokopenko]))
    iconrow("\u{f0ac}", [Tokyo, Japan])
  }
)

#v(0.5em)

// Who Am I + Languages
#grid(
  columns: (35%, 62%),
  gutter: 3%,
  [
    #cvsect("Who Am I?")
    Curious Systems Engineer skilled at designing complex systems and understanding how they work end-to-end

    I have been tinkering with programming languages design, implementation and tooling for over eight years,
    and look forward to continuing to work on bleeding edge technologies
  ],
  [
    #cvsect("Languages & Technologies that I know")
    #let lang-row-spacing = -0.8em
    #let langrow(label, content) = {
      grid(
        columns: (6.5em, 1fr),
        gutter: 0.5em,
        align(right+top)[#blackbox[#label]],
        align(left)[#content]
      )
      v(lang-row-spacing)
    }
    #langrow[Native][C, #Cpp, Rust, Python]
    #langrow[Fluent][Java, Zig, Go, Haskell]
    #langrow[Professional][Idris, Kotlin, Ruby, TypeScript, C\#, GDScript]
    #langrow[Basic][Bash, Coq, Arend, SQL, Prolog, ECMAScript, Elixir, x86 assembly, LaTeX, Solidity, Lua]
    #v(-lang-row-spacing/2)
    #align(center, line(length: 80%, stroke: 0.3pt))
    #v(lang-row-spacing/2)
    #langrow[Techs][git, ANTLR4, Happy, tsc, OpenJDK, Z3, CMake, ...]
    #v(-lang-row-spacing/2)
    #align(center, line(length: 80%, stroke: 0.3pt))
    #v(lang-row-spacing/2)
    #langrow[Natural][English (\u{007E}C2), Japanese (\u{007E}N4), Russian (native)]
  ]
)

#cvsect("Experience")

#entry(
  [2024 --- current],
  [Compiler Engineer],
  [#link("https://www.genlayer.com")[GenLayer Labs]],
  [
    Created wasm-based virtual machine#mycode("https://github.com/genlayerlabs/genvm")
    + Designed & Implemented specialized VM
    + Modified Wasmtime for project needs
    + Created storage DB for asynchronous blockchain
    + Consensus algorithm rework (x2) --- proposed and adopted
    #techs("WASM", "Rust", "Python", "Blockchain", "Go")
  ]
)

#entry(
  [2022 --- 2024],
  [Compiler and Runtime Engineer],
  [Huawei R&D],
  [
    Worked on standard libraries development, and implemented following from scratch:
    + Interoperability between statically and dynamically typed languages, including effective JIT compilation and working with common GC#mycode("https://gitee.com/kprokopenko/arkcompiler_runtime_core/pulls/1")#mycode("https://gitee.com/kprokopenko/arkcompiler_ets_runtime/pulls/1") Got 2x performance increase
    + Type Creation API in reflections library
    + Documentation generator from source code#mycode("https://gitee.com/kprokopenko/arkcompiler_ets_frontend/tree/documentation-generator/")
    + Bytecode files linker#mycode("https://gitee.com/kprokopenko/arkcompiler_runtime_core/tree/linker-pull")
    + Language generation into unmatching VM bytecode, including Type API

    #techs("C++", "Go", "x86_64 asm", "TypeScript", "Ruby", "Private languages", "ANTLR4")
  ]
)

#entry(
  [2020\ #text(size: 7pt)[intern]],
  [Junior #Cpp Developer],
  [vasexpets],
  [
    Worked on system intrusion monitor, which supervised usb devices and services
    #techs("C++", "GNU/Linux")
  ]
)

#cvsect("Education")

#entry(
  [2019 --- 2023\ #text(size: 7pt)[Bachelor's Degree]],
  [Applied Math and CS],
  [#link("https://en.itmo.ru")[ITMO University]],
  [
    Among other subjects, I studied type theory, logics in category theory and semantics of programming languages. Implemented following projects:
    #grid(
      columns: (1fr, 1fr),
      gutter: 1em,
      [
        + Lama compiler to x86_32 with mark-and-copy GC#mycode("https://github.com/kp2pml30/compilers-supplementary/tree/A10-gc")
        + LL(1) parser generator (Haskell#mycode("https://github.com/kp2pml30/ifmo-labs/tree/master/translation-methods/4") | Idris)
        + Copy-on-write fork in xv6#mycode("https://github.com/kp2pml30/ifmo-labs/tree/master/os/cow-kp2pml30")
        + Proofs in Coq (big/small step semantics, Hoare triples)#mycode("https://github.com/kp2pml30/ifmo-labs/tree/master/semantics")
      ],
      enum(start: 5,
        [Toy language interpreter in Haskell#mycode("https://github.com/kp2pml30/ifmo-labs/tree/master/fp/hw3")],
        [Intrinsic in OpenJDK for RISC-V],
        [Sea of Nodes IR for TypeScript#mycode("https://github.com/kp2pml30/ifmo-labs/blob/master/verification-tools/ssa/src/index.ts")],
        [DPLL SAT solver],
      )
    )
  ]
)

#entry(
  [2015 --- 2019],
  [School, #link("https://school30.spb.ru/cgsg/")[Computer Graphics Support Group]],
  [#link("https://school30.spb.ru/cgsg/")[Physics and Mathematics Lyceum \#30, St. Petersburg]],
  [
    Gave talks at 9 scientific conferences. Personal projects include:
    + Realtime 3D rendering engine with OpenGL/DirectX & WinAPI
    + Ray tracing engine on CPU
    + Ray marching framework using SDF on GPU
    #techs("C", "C++", "OpenGL", "DirectX", "GLSL", "HLSL")
  ]
)

#cvsect("Personal Projects")

- Soldered ESP32-based smart clock with custom Zig firmware
