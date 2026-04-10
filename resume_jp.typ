#import "resume_jp/personal.typ": personal

#set page(paper: "jis-b5", margin: 1.5cm)
#set text(size: 8pt, lang: "ja", font: ("IPAexGothic",))

#let inputFontSize = 10pt
#let nameFontSize = 16pt

#let addSpace(input) = box(pad(left: 1cm, input))

#let s-outer = 1.5pt
#let s-inner = 0.5pt

// Compute age from birth date and today's date (from personal data)
#let age = personal.今日年 - personal.誕生年 - if (personal.今日月 < personal.誕生月 or (personal.今日月 == personal.誕生月 and personal.今日日 < personal.誕生日)) { 1 } else { 0 }

// ============================================================
// Page 1
// ============================================================

// --- Title and date ---
#grid(
  columns: (1fr, auto, 1fr),
  [],
  text(size: 1.8em, weight: 400, tracking: 0.5em)[履 歴 書],
  align(right + bottom)[#personal.今日年 年#h(0.3em)#personal.今日月 月#h(0.3em)#personal.今日日 日現在],
)
#v(0.5em)

// --- Personal info (left) + Photo (right) ---
// Row 1-2: Name block | Photo
// Row 3: Nationality/Birthday/Gender | Photo
// Row 4-7: Address + Contact

#let photo-block = {
  set text(size: 7pt)
  pad(
    left: 0.3cm,
    box(
      stroke: (dash: "dashed"),
      height: 4cm,
      width: 3cm,
      if personal.写真 == "" {
        align(center + horizon, [写真を貼る位置\ (縦 40mm, 横 30mm)])
      } else {
        image(personal.写真, width: 3cm, height: 4cm)
      },
    ),
  )
}

// --- Name rows + nationality/birthday/gender ---
#grid(
  columns: (1fr, auto),
  // Left: personal info stack
  stack(
    // Furigana
    rect(
      stroke: (bottom: none, top: s-outer, left: s-outer, right: s-outer),
      width: 100%,
      inset: (x: 0pt, y: 0pt),
      grid(
        columns: (1.5cm, 1fr),
        inset: 5pt,
        rect(width: 100%, stroke: none, inset: 2pt)[#text(size: 7pt)[ふりがな]],
        grid(
          columns: (1fr, 1fr),
          inset: 2pt,
          align(center, text(size: 7pt, personal.性読み)),
          align(center, text(size: 7pt, personal.名読み)),
        ),
      ),
    ),
    line(length: 100%, stroke: (dash: "dashed")),
    // Name
    rect(
      stroke: (bottom: s-inner, top: none, left: s-outer, right: s-outer),
      width: 100%,
      inset: 0pt,
      grid(
        columns: (1.5cm, 1fr),
        inset: 5pt,
        align(horizon)[氏 #h(0.3cm) 名],
        pad(y: 0.3cm, grid(
          columns: (1fr, 1fr),
          align(center + horizon, text(nameFontSize, personal.性)),
          align(center + horizon, text(nameFontSize, personal.名)),
        )),
      ),
    ),
    // Nationality / Birthday / Gender
    rect(
      stroke: (bottom: s-inner, top: none, left: s-outer, right: s-outer),
      width: 100%,
      inset: 0pt,
      grid(
        columns: (1.2cm, 1.8cm, 1fr, 1.2cm, auto),
        inset: 5pt,
        align(horizon)[国籍],
        align(horizon, text(inputFontSize, personal.国籍)),
        align(horizon)[生年月日（年齢）#h(0.5em) #text(inputFontSize)[#personal.生年月日 生 #h(0.3em) （満 #age 歳）]],
        align(horizon)[性別],
        align(horizon, text(inputFontSize)[
          #let circled(body) = box(baseline: 20%, inset: 0pt, circle(radius: 0.55em, stroke: 0.5pt, align(center + horizon, body)))
          #let plain(body) = box(baseline: 20%, inset: 0pt, circle(radius: 0.55em, stroke: none, align(center + horizon, body)))
          #if personal.性別 == "男" [
            #circled[男] ・ #plain[女]
          ] else [
            #plain[男] ・ #circled[女]
          ]
        ]),
      ),
    ),
  ),
  // Right: photo
  align(top, photo-block),
)

// --- Address block (left) + Contact block (right) ---
#table(
  columns: (5fr, 2fr),
  rows: (auto, 1.8cm, auto, 1.8cm),
  stroke: none,
  inset: 5pt,
  // Row 1: furigana + phone 1
  table.cell(
    stroke: (top: s-outer, left: s-outer, right: s-inner, bottom: none),
    inset: 0pt,
    stack(
      pad(x: 5pt, y: 3pt, grid(
        columns: (1.5cm, 1fr),
        text(size: 7pt)[ふりがな],
        align(center, text(size: 7pt, personal.住所ふりがな1)),
      )),
      line(stroke: (dash: "dashed"), length: 100%),
    ),
  ),
  table.cell(
    stroke: (top: s-outer, right: s-outer, bottom: s-inner, left: s-inner),
  )[電話 #h(10pt) #text(inputFontSize, personal.電話番号1)],
  // Row 2: address 1 + email 1
  table.cell(
    stroke: (left: s-outer, right: s-inner, bottom: s-inner, top: none),
  )[
    #if personal.郵便番号1 == "" {
      [現住所 (〒 #h(20pt) - #h(20pt))]
    } else {
      [現住所 (〒 #text(tracking: 1pt, 8pt, personal.郵便番号1))]
    }
    #pad(y: 0.15cm, align(center, text(inputFontSize, personal.住所1)))
  ],
  table.cell(
    stroke: (right: s-outer, bottom: s-inner, left: s-inner, top: s-inner),
  )[
    メールアドレス
    #pad(y: 0.3cm, align(center, text(size: 7pt, personal.Email1)))
  ],
  // Row 3: furigana + phone 2
  table.cell(
    stroke: (left: s-outer, right: s-inner, bottom: none, top: s-inner),
    inset: 0pt,
    stack(
      pad(x: 5pt, y: 3pt, grid(
        columns: (1.5cm, 1fr),
        text(size: 7pt)[ふりがな],
        align(center, text(size: 7pt, personal.住所ふりがな2)),
      )),
      line(stroke: (dash: "dashed"), length: 100%),
    ),
  ),
  table.cell(
    stroke: (right: s-outer, bottom: s-inner, left: s-inner, top: s-inner),
  )[電話 #h(10pt) #text(inputFontSize, personal.電話番号2)],
  // Row 4: address 2 + email 2
  table.cell(
    stroke: (left: s-outer, right: s-inner, bottom: s-outer, top: none),
  )[
    #if personal.郵便番号2 == "" {
      [連絡先 (〒 #h(20pt) - #h(20pt))]
    } else {
      [連絡先 (〒 #text(tracking: 1pt, 8pt, personal.郵便番号2))]
    }
    #v(0.1cm)
    #align(center, text(inputFontSize)[
      #if personal.住所2 == "" [同上] else [#personal.住所2]
    ])
  ],
  table.cell(
    stroke: (right: s-outer, bottom: s-outer, left: s-inner, top: s-inner),
  )[
    メールアドレス
    #pad(y: 0.3cm, align(center, text(size: 7pt, personal.Email2)))
  ],
)

#v(0.5em)

// --- History as auto-splitting table ---
#let hist-inset = (x: 4pt, y: 5pt)

// Stroke helper: outer borders on edges, inner separators everywhere
#let hist-stroke(x, y) = {
  let left-s  = if x == 0 { s-outer } else { s-inner }
  let right-s = if x == 2 { s-outer } else { s-inner }
  (left: left-s, right: right-s, top: s-inner, bottom: s-inner)
}

// Section header row (学歴 / 職歴) — bold top+bottom borders, centered, spans all cols
#let section-header(label) = (
  table.cell(colspan: 3, stroke: (left: s-outer, right: s-outer, top: s-outer, bottom: s-outer))[
    #align(center, text(weight: "bold", label))
  ],
)

// Normal entry row
#let entry(year, month, content) = (
  align(center, year), align(center, month), [#h(5pt)#content],
)

// 以上 marker
#let end-marker = (
  table.cell(colspan: 3, stroke: (left: s-outer, right: s-outer, top: s-inner, bottom: s-outer))[
    #align(end, [以上#h(2cm)])
  ],
)

// --- Education & Work History ---
#table(
  columns: (1.5cm, 0.8cm, 1fr),
  inset: hist-inset,
  stroke: hist-stroke,
  // Header
  table.header(
    table.cell(stroke: (left: s-outer, right: s-inner, top: s-outer, bottom: s-outer))[#align(center)[年]],
    table.cell(stroke: (left: s-inner, right: s-inner, top: s-outer, bottom: s-outer))[#align(center)[月]],
    table.cell(stroke: (left: s-inner, right: s-outer, top: s-outer, bottom: s-outer))[#align(center)[学歴・職歴（各別にまとめて書く）]],
  ),
  // 学歴
  ..section-header[学歴],
  ..entry([2015], [4], [物理数学リセウム \#30（サンクトペテルブルク）入学]),
  ..entry([2019], [6], [同校 卒業]),
  ..entry([2019], [9], [ITMO大学 応用数学・情報科学学部 入学]),
  ..entry([2023], [7], [同大学 同学部 卒業（学士号取得）]),
  // 職歴
  ..section-header[職歴],
  ..entry([2020], [7], [VAS Experts インターン（ジュニア開発者）]),
  ..entry([2020], [12], [同社 退社]),
  ..entry([2022], [2], [Huawei R&D 入社（コンパイラエンジニア・業務委託）]),
  ..entry([2024], [3], [同社 退社]),
  ..entry([2024], [4], [Teza Technologies 入社（ソフトウェアエンジニア）]),
  ..entry([2024], [7], [同社 退社]),
  ..entry([2024], [8], [GenLayer Labs 入社（コンパイラエンジニア・業務委託）]),
  ..entry([], [], [現在に至る]),
  ..end-marker,
)

// --- Certifications ---
#table(
  columns: (1.5cm, 0.8cm, 1fr),
  inset: hist-inset,
  stroke: hist-stroke,
  table.header(
    table.cell(stroke: (left: s-outer, right: s-inner, top: s-outer, bottom: s-outer))[#align(center)[年]],
    table.cell(stroke: (left: s-inner, right: s-inner, top: s-outer, bottom: s-outer))[#align(center)[月]],
    table.cell(stroke: (left: s-inner, right: s-outer, top: s-outer, bottom: s-outer))[#align(center)[免許・資格]],
  ),
  ..entry([2026], [3], [TOEIC Listening & Reading 975点]),
  ..end-marker,
)

#v(0.5em)

// --- Motivation ---
#rect(
  stroke: (bottom: 1.5pt, top: 1.5pt, left: 1.5pt, right: 1.5pt),
  height: 5cm,
  width: 100%,
  [
    志望の動機、特技、好きな学科、アピールポイントなど
    #linebreak()
    #set text(inputFontSize)
    8年以上にわたりプログラミング言語の設計・実装・ツール開発に携わってきました。コンパイラ、仮想マシン、
    ランタイムシステムの開発を通じて、最先端の技術に挑戦し続けることに強い意欲を持っています。
    日本での経験を活かし、技術力と多言語能力を組み合わせて貴社の事業に貢献したいと考えております。
  ],
)

#v(0.5em)

// --- Applicant requests ---
#rect(
  stroke: (bottom: 1.5pt, top: 1.5pt, left: 1.5pt, right: 1.5pt),
  height: 5cm,
  width: 100%,
  [
    本人希望記入欄（特に給料・職種・勤務時間・勤務地・その他についての希望があれば記入）
    #linebreak()
    #set text(inputFontSize)
    貴社の規定に従います。
  ],
)
