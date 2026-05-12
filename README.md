# Slides

Monorepo de slides em LaTeX.

Cada disciplina fica em sua propria pasta dentro de `subjects/`, com:

- um arquivo principal da disciplina
- uma pasta `lectures/` com os arquivos `.tex` de cada aula
- uma pasta `build/` com PDFs, logs e arquivos auxiliares gerados na compilacao

## Estrutura

```text
.
├── common/
│   ├── assets/
│   └── theme/
├── subjects/
│   └── poo/
│       ├── lectures/
│       │   ├── 01-introduction/
│       │   │   └── 01-introduction.tex
│       │   └── 02-java-platform/
│       │       └── 02-java-platform.tex
│       ├── build/
│       │   ├── aux/
│       │   └── pdf/
│       └── poo.tex
├── latexmkrc
└── README.md
```

## Como o projeto funciona

- `common/theme/` concentra a classe e o tema compartilhados.
- `common/assets/` guarda recursos visuais compartilhados.
- Cada arquivo de aula pode ser compilado isoladamente.
- O arquivo principal da disciplina compoe o PDF final por meio de `\\input` das aulas.
- As capas das aulas sao mantidas tambem no PDF principal da disciplina.

## Compilacao

Assuma sempre a execucao a partir da raiz do repositorio.

O arquivo `latexmkrc` ja configura:

- `TEXINPUTS` para encontrar `common/theme` e `common/assets`
- `build/pdf` para os PDFs
- `build/aux` para logs e arquivos auxiliares

### Compilar a disciplina

```bash
latexmk -cd "subjects/poo/poo.tex"
```

PDF gerado em:

```text
subjects/poo/build/pdf/poo.pdf
```

### Compilar uma aula isoladamente

```bash
latexmk -cd "subjects/poo/lectures/01-introduction/01-introduction.tex"
```

PDF gerado em:

```text
subjects/poo/lectures/01-introduction/build/pdf/01-introduction.pdf
```

## Limpeza

Para remover arquivos gerados de uma compilacao:

```bash
latexmk -C -cd "subjects/poo/poo.tex"
```

Ou para uma aula especifica:

```bash
latexmk -C -cd "subjects/poo/lectures/01-introduction/01-introduction.tex"
```

## Convencoes

- O nome do diretorio da aula deve acompanhar o nome do arquivo `.tex`.
- O arquivo principal da disciplina deve apenas compor as aulas.
- Configuracoes visuais e estruturais devem ficar em `common/theme/`.
- Recursos compartilhados devem ficar em `common/assets/`.

## VS Code

O workspace inclui configuracoes em `.vscode/settings.json` para:

- permitir que o LaTeX Workshop encontre `idpbeamer.cls`
- alinhar diretorios de saida com o `latexmk`
- reduzir falsos positivos do `cSpell`
