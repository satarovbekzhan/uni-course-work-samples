class CYK {
    // Граммаика языка.
    grammar = []
    // Строка для проверки.
    word = ''
    // Матрица CYK для работы алгоритма.
    matrix = []

    // Конструктор класса.
    constructor(grammar, word, logFunction) {
        this.grammar = grammar
        this.word = word
        this.log = logFunction
        for (let i = 0; i < word.length + 1; i++) {
            this.matrix[i] = new Array()
        }
        for (let i = 0; i < this.word.length + 1; i++) {
            for (let j = 0; j < this.word.length + 1; j++) {
                if (j > 0 && i === 0) this.matrix[i][j] = '[' + this.word.charAt(j - 1) + ']'
                else if (j === 0 && i > 0) this.matrix[i][j] = '[' + i + ']'
                else if (j === 0 && i === 0) this.matrix[i][j] = ''
                else this.matrix[i][j] = i + '.' + j
            }
        }
    }

    // Вызывает нужные функции.
    init = () => {
        this.log('☕ Строка для проверки:<br>', true)
        this.log(this.word + '<br><br>')

        this.log('☕ Грамматика:<br>')
        this.log(this.grammar.join('<br>'))
        
        this.logMatrix('Начальная матрица')
        this.reshapeRequiredMatrix()
        this.logMatrix('reshapeRequiredMatrix')
        this.defineCellLetters()
        this.logMatrix('defineCellLetters')
        this.determineLetterVariations()
        this.logMatrix('determineLetterVariations')
        this.proceed()
        this.logMatrix('proceed')
    }

    // ???
    // Перезаписывает значения клеток на терминальные значения
    // которые дают подстроку.
    proceed = _ => {
        let oldMatrix = [...this.matrix]
        for (let i = 0; i < this.word.length + 1; i++) {
            for (let j = 0; j < this.word.length - i + 2; j++) {
                if (j > 0 && i > 0) {
                    let nonTerminals = this.matrix[i][j].split(',')
                    if (i === 1) {
                        this.matrix[i][j] = this.findGrammarTerminals(nonTerminals[0])
                    } else {
                        //this.matrix[i][j] = '*'
                    }
                }
            }
        }
    }

    // ???
    // Возвращает терминальные значения для данной строки,
    // основываясь на значения матрицы.
    findMatrixTerminals = substring => {
        return [] // b -> B
    }

    // Возвращает терминальные значения для данной строки,
    // основываясь на значения грамматики.
    findGrammarTerminals = substring => {
        let terminals = []
        for (let i = 0; i < this.grammar.length; i++) {
            if (this.grammar[i].trim() === '') continue
            let terminal = this.grammar[i].split(' -> ')[0]
            let values = this.grammar[i].split(' -> ')[1].split('|')
            if (values.includes(substring)) {
                terminals.push(terminal)
            }
        }
        return terminals.join(',')
    }

    // Определяет всевозможные вариации подстрок каждой клетки.
    determineLetterVariations = _ => {
        for (let i = 1; i < this.word.length + 1; i++) {
            for (let j = 1; j < this.word.length - i + 2; j++) {
                let letters = this.matrix[i][j]
                this.matrix[i][j] = ''
                let variations = []
                if (letters.length === 1) {
                    variations.push(letters)
                } else {
                    for (let n = 1; n < letters.length; n++) {
                        variations.push(letters.substr(0, n) + '-' + letters.substr(n, letters.length))
                    }
                }
                for (let k = 0; k < variations.length; k++) {
                    this.matrix[i][j] += variations[k] + ','
                }
            }
        }
    }

    // Определяет подстроку строки для ячейки,
    // которую нужно определить.
    defineCellLetters = _ => {
        for (let i = 1; i < this.word.length + 1; i++) {
            for (let j = 1; j < this.word.length - i + 2; j++) {
                let letters = this.word.substr(j - 1, i)
                this.matrix[i][j] = letters
            }
        }
    }

    // Изменяет форму матрицы для наглядности,
    // удаляя значения ненужных ячеек.
    reshapeRequiredMatrix = _ => {
        for (let i = 1; i < this.word.length + 1; i++) {
            for (let j = 1; j < this.word.length + 1; j++) {
                if (j >= this.word.length - i + 2) {
                    this.matrix[i][j] = ''
                }
            }
        }
    }

    // Выводит состояние матрицы на экран
    // вместе с переданным заголовком.
    logMatrix = title => {
        let longestSymbol = 1
        for (let i = 0; i < this.word.length + 1; i++) {
            for (let j = 0; j < this.word.length + 1; j++) {
                longestSymbol = (this.matrix[i][j].length > longestSymbol) ? this.matrix[i][j].length : longestSymbol
            }
        }
        this.log('<br>')
        this.log('⚡ ' + title)
        this.log('<br>')
        for (let i = 0; i < this.word.length + 1; i++) {
            for (let j = 0; j < this.word.length + 1; j++) {
                // &nbsp;
                let space = '.'.repeat((longestSymbol - this.matrix[i][j].length) + 1)
                this.log('<th>' + this.matrix[i][j] + space + '</th>')
            }
            this.log('<br>')
        }
        this.log('</table>')
    }
}