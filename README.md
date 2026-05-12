# Slides

Cada disciplina fica em sua própria pasta dentro de `subjects/`, com:

- um arquivo principal da disciplina
- uma pasta `lectures/` com os arquivos `.tex` de cada aula
- uma pasta `code/` com exemplos de código usados nas aulas

## Estrutura

```text
.
├── common/
│   ├── assets/
│   └── theme/
├── subjects/
│   └── poo/
│       ├── code/
│       │   └── OlaMundo.java
│       ├── lectures/
│       │   ├── 01-introduction.tex
│       │   └── 02-java-platform.tex
│       └── poo.tex
├── build/
│   ├── aux/
│   └── pdf/
├── latexmkrc
└── README.md
```

## Como o projeto funciona

- `common/theme/` concentra a classe e o tema compartilhados.
- `common/assets/` guarda recursos visuais compartilhados.
- Cada arquivo de aula pode ser compilado isoladamente.
- O arquivo principal da disciplina compõe o PDF final por meio de `\\input` das aulas.
- As capas das aulas sao mantidas também no PDF principal da disciplina.

## Compilação

Assuma sempre a execução a partir da raiz do repositório.

O arquivo `latexmkrc` ja configura:

- `TEXINPUTS` para encontrar `common/theme` e `common/assets`
- `build/pdf` na raiz do repositório para os PDFs
- `build/aux` na raiz do repositório para logs e arquivos auxiliares

### Compilar a disciplina

```bash
latexmk -cd "subjects/poo/poo.tex"
```

PDF gerado em:

```text
build/pdf/poo.pdf
```

### Compilar uma aula isoladamente

```bash
latexmk -cd "subjects/poo/lectures/01-introduction.tex"
```

PDF gerado em:

```text
build/pdf/01-introduction.pdf
```

## Limpeza

Para remover arquivos gerados de uma compilação:

```bash
latexmk -C -cd "subjects/poo/poo.tex"
```

Ou para uma aula especifica:

```bash
latexmk -C -cd "subjects/poo/lectures/01-introduction.tex"
```

## Convenções

- Os arquivos de aula ficam diretamente em `lectures/`.
- Exemplos de código compartilhados pela disciplina ficam em `code/`.
- O arquivo principal da disciplina deve apenas compor as aulas.
- Configurações visuais e estruturais devem ficar em `common/theme/`.
- Recursos compartilhados devem ficar em `common/assets/`.

## VS Code

O workspace inclui configurações em `.vscode/settings.json` para:

- permitir que o LaTeX Workshop encontre `idpbeamer.cls`
- alinhar diretórios de saída com o `latexmk`
- reduzir falsos positivos do `cSpell`
