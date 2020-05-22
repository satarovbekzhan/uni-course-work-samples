let instructions = 'Заполните грамматику в нормальной форме Хомского.\nИспользуйте знак "->" для указания.\nЗнак "|" является стандартным разделителем.\nУкажите строку для проверки и нажмите ПРОВЕРИТЬ.'

document.getElementById('title').addEventListener('click', e => {
    alert(instructions)
})

log = async (message, clear) => {
    let output = document.getElementById('output')
    if (typeof clear !== 'undefined') {
        if (clear) output.innerHTML = message
        else output.innerHTML += message
    } else {
        output.innerHTML += message
    }
}

document.getElementById('button').addEventListener('click', e =>{
    let grammar = []
    let word = document.getElementById('word').value.trim()
    
    let array = document.getElementById('grammar').value.split('\n')
    array.forEach(line => {
        grammar.push(line)
    });

    if (word === '') log('Строка не может быть пустой!', true)
    else {
        if ((grammar.length === 0) || (grammar.length === 1 && grammar[0] === '')) log('Добавьте минимум одну грамматику!', true)
        else {
            let analyzer = new CYK(grammar, word, log)
            analyzer.init()
        }
    }
})

log('', true)
instructions.split('\n').forEach(line => {
    log('‧ ' + line + '<br>')
});