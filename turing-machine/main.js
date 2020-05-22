/**
 * Графическая обработка информации
 */

let tape = [ // Лента с начальными пустыми значениями
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_",
    "_"
]
let alphabet = ["_"] // Алфавит с начальными пустыми значениями
let states = [[]] // Матрица состояний машины (q1, q2 и т.д.)
let stateIndex = 2 // Количество колон в матрице

// DOM объекты пронраммы (блоки, кнопки и т.д.)
let reset_button = document.getElementById("reset") // Кнопка сброса
let alphabet_input = document.getElementById("alphabet") // Поле ввода алфавита
let tape_div = document.getElementById("tape") // Обертка ленты
let add_new_cell_before_button = document.getElementById("add_new_cell_before") // Кнопка перед значениями ленты
let add_new_cell_after_button = document.getElementById("add_new_cell_after") // Кнопка после значений ленты
let states_div = document.getElementById("states") // Внешняя обертка таблицы состояний
let tBody = document.getElementsByTagName("tbody") // Внутреняя обертка (тело) таблицы состояний
let add_column_button = document.getElementById("add_column") // Кнопка добавления новой колонны

alphabet_input.addEventListener("change", e => { // Слушатель событий изменения значения в поле алфавита
    alphabet = [] // Очищаем массив алфавита
    alphabet.push("_") // Добавляем знак 'пустого значения'
    let chars = alphabet_input.value // Присваиваем переиенному chars значения алфавита
    for (let i = 0; i < chars.length; i++) { // Перебираем значения алфавита по одному
        if (!alphabet.includes(chars.charAt(i))) { // Проверяем присутствие данного знака в алфавите
            alphabet.push(chars.charAt(i)) // Если нет то добавляем его в массив
        }
    }
    alphabet_input.value = alphabet.join("") // В поле ввода алфавита указываем значения валидного алфавита
    refreshTape() // Вызываем функцию для обновления ленты
    updateStateMatrix() // Вызываем функцию для обновления матрицы состояний
})

function startTapeDiv() { // Функция инициализирует клетки ленты
    tape.forEach(element => { // Перебираем все все зачения ленты
        let selectCell = document.createElement('select') // Создаем элемент select(выбрать)
        alphabet.forEach(element => { // Перебираем наш алфавит
            let o = document.createElement("option") // Создаем элемент option(опция)
            o.value = element // Указываем значение для option (знак алфавита)
            o.appendChild(document.createTextNode(element)) // Также указываем символ для option
            selectCell.appendChild(o) // Доьавляем созданный option в элемент select
        })
        tape_div.insertBefore(selectCell, add_new_cell_after_button) // Добавляем клетку select с опциями в ленту
    })
}
startTapeDiv() // Вызываем функцию инициализации ленты один раз в начале запуска программы для его инициализации

function refreshTape() {// Функция обновляет ленту исходя из значений алфавита
    let selectCells = document.getElementsByTagName("select") // Присваиваем переменной selectCells список элементов(клеток) ленты
    for (let i = 0; i < selectCells.length; i++) { // перебираем их
        let element = selectCells[i] // Присваиваем переменной element значания выбранной клетки
        while (element.firstChild) { // Проверяем есть ли дочерние элементы(option)
            element.removeChild(element.lastChild) // Удаляем все элементы
        }
        alphabet.forEach(e => { // Перебираем значения алфавита
            let o = document.createElement("option") // Создаем новую опцию
            o.value = e // Указываем его значения
            o.appendChild(document.createTextNode(e)) // Указываем знак(символ) опции
            element.appendChild(o) // Добавляем его как дочерний элемент в клетку
        })
    }
}

add_new_cell_before_button.addEventListener("click", e => { // Слушатель событий клика кнопки 'добавить клетку в самом начале' 
    tape.unshift("_") // Добавляем пустое значение в ленту (в начале)
    let selectCell = document.createElement('select') // Создаем для него select
    alphabet.forEach(element => { // Перебираем алфавит
        let o = document.createElement("option") // Создаем опцию
        o.value = element // Указываем значение
        o.appendChild(document.createTextNode(element)) // Указываем знак
        selectCell.appendChild(o) // Добавлям его в select
    })
    add_new_cell_before_button.parentNode.insertBefore(selectCell, add_new_cell_before_button.nextSibling) // Помещаем созданную клетку(select) в самом начале ленты
})

add_new_cell_after_button.addEventListener("click", e => { // Слушатель событий клика кнопки 'добавить клетку в самом конце'
    tape.push("_") // Добавляем пустое значение в ленту (в конце)
    let selectCell = document.createElement('select') // Создаем для него select
    alphabet.forEach(element => { // Перебираем алфавит
        let o = document.createElement("option") // Создаем опцию
        o.value = element // Указываем значение
        o.appendChild(document.createTextNode(element)) // Указываем знак
        selectCell.appendChild(o) // Добавлям его в select
    })
    add_new_cell_after_button.parentNode.insertBefore(selectCell, add_new_cell_after_button) // Помещаем созданную клетку(select) в самом конце ленты
})

reset_button.addEventListener("click", e => { // Слушатель событий клика кнопки сбросить
    alphabet = ["_"] // Возвращаем алфавит в начальное состояние
    tape = ["_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"] // Возвращаем ленту в начальное состояние
    alphabet_input.value = "" // Поле ввода алфавита тоже очищаем
    stateIndex = 2 // Указываем количество колон ка 2(нулевое для пустого и первую для индекса состояния)
    updateStateMatrix() // Вызываем функцию обновления матрицы состояний
    let selectCells = document.getElementsByTagName('select') // Выбираем все клетки ленты
    while (selectCells[0]) selectCells[0].parentNode.removeChild(selectCells[0]) // Удаляем все клетки
    startTapeDiv() // Вызываем функцию инициализации клеток ленты
})

function updateStateMatrix() { // Функция обновления матрицы
    let ch = tBody[0].lastChild // Удаляем все внутренние элементы тела таблицы
    while (ch) { // Сперва проверяем на наличие
        tBody[0].removeChild(ch) // В случае наличии удаляем
        ch = tBody[0].lastChild // Временно приваиваем переменной ch последний имеющийся элемент(child)
    }

    let headRow = document.createElement("tr") // Создаем элемент tr(table row - строка таблицы)
    headRow.appendChild(document.createElement("th")) // Помещаем в него пустой элемент th (самая верхняя пустая яцейка таблицы)
    let butt = document.createElement("button") // Создаем кнопку добавления новой колонны
    butt.id = "add_column" // Присваиваем идентификатор
    butt.onclick = addNewStateColumn // Присваиваем функцию которая вызовится при клике
    butt.title = "Add New State Column" // Добавляем комментарий
    butt.appendChild(document.createTextNode("+")) // Указываем знак
    headRow.appendChild(document.createElement("th").appendChild(butt)) // Помещаем кнопку в tr
    tBody[0].appendChild(headRow) // И tr также помещяем в тело таблицы

    let add_column_button = document.getElementById("add_column") // Переопределяем кннопку добавления новой колонны

    states = [[]] // Очищаем таблицу состояний

    for (let i = 0; i < alphabet.length + 1; i++) { // Перебираем алфавит
        states.push([]) // Добавляем в матрицу состояний говый массив
        let trRow = document.createElement("tr") // Создаем новый элемент tr
        for (let n = 0; n < stateIndex; n++) { // Итерируем n раз, где n = количество состояний(q)
            states[i].push("") // Добавляем пустую строку в i-ную строку
            if (i === 0 && n === 0) { // Самая верхняя левая ячейка пустая
                // Оставляем как есть
            } else if (i === 0 && n > 0) { // Если эта самая верхняя строка
                let thState = document.createElement("th") // Создаем элемент th(table head-заголовок таблицы)
                thState.appendChild(document.createTextNode("q" + n)) // Указываем знак (сцепляем знак q с индексом)
                add_column_button.parentNode.insertBefore(thState, add_column_button) // Добавляем th перед кнопкой добавления новой колонки
            } else if (i > 0 && n === 0) { // Если эта самый левый столбец
                let thCell = document.createElement("th") // Также создаем th
                thCell.appendChild(document.createTextNode(alphabet[i-1])) // Указываем знак из алфавита по индексу
                trRow.appendChild(thCell) // Помещаем th в начале строки
            } else if (i > 0 && n > 0) { // Если эта остальные значения
                let tdCell = document.createElement("td") // Создаем td (стандартная ячейка)
                let inputCell = document.createElement("input") // Создаем поле ввода
                inputCell.type = "text" // Указываем тип поля как text(текстовые значения)
                inputCell.id = "" + i + n // Указываем идентификатор по индксу вертикали и горизонтали
                tdCell.appendChild(inputCell) // Помещаем поле в ячейку
                trRow.appendChild(tdCell) // И помещаем ячейку в строку
            }
        }
        if (i > 0) { // Проверяем не самая ли верхняя строка
            tBody[0].appendChild(trRow) // Если да, то добавляем(помещаем) созданную строку в тело таблицы
        }
    }
}

updateStateMatrix() // Вызываем функцию обновления матрицы один раз при запуске программы

function addNewStateColumn() { // Функция добавляет новый столбец в матрицу состояний
    stateIndex++ // Увеличиваем количество(индекс) столбцов на 1
    updateStateMatrix() // И вызываем функцию обновления матрицы
}

let info_button = document.getElementById("info") // Определяем кнопку 'информация'
info_button.addEventListener("click", e => { // Слушатель событий клика кнопки 'информация'
    let instruction = "1) Введите значения алфавита в поле ввода 'alphabet'.\n" + // Инструкция использования
                    "2) Заполните матрицу состояний по шаблону 'x>2', где:\n" +
                    "     x - новое значение;\n" +
                    "     > - направление направо (< - налево, . - никуда);\n" +
                    "     2 - следующее состояние (0 - значит завершение).\n" +
                    "3) Укажите значения ленты (нажмите кнопку '+' чтобы добавить новую клетку).\n" +
                    "4) Нажмите на кнопку старт.\n" +
                    "\n" +
                    "P.S. При добавлении нового столбца остальные значения стираются, так что старайтесь добалять новые столбцы перед тем как заполнить.\n" +
                    "\n" +
                    "По вопросам обращаться по почте satarovbekzhan@gmail.com."
    alert(instruction) // Вывод инстркуции на эран
})

/**
 * Извлечение информации от пользователя
 */

let start_button = document.getElementById("start") // Кнопка запуска
start_button.addEventListener("click", e => { // Слушатель событий клика на кнопку запуска
    let input = [] // Новый пустой лист для значений ленты
    let selectCells = document.getElementsByTagName("select") // Выбираем все элементы select
    for (let i = 0; i < selectCells.length; i++) { // Перебираем все клетки ленты
        input.push(selectCells[i].value) // Ложим в ранее созданный список
    }

    let transitions = [] // Новый пустой лист для состояний(q)
    for (let i = 0; i < alphabet.length + 1; i++) { // Перебираем матрицу событий по вертикали
        for (let n = 0; n < stateIndex; n++) { // Для каждой строки перебираем по горизонтали
            //states[i].push("")
            if (i > 0 && n > 0) { // Проверяем является ли ячейка валидной(не является заголовком)
                let cell = document.getElementById("" + i + n) // Находим ячейку по иденфикатору
                let oldValue = alphabet[i-1] // Старое значение состояния
                let newValue = cell.value.charAt(0) // Новое значение
                let direction = cell.value.charAt(1) // Направление
                let oldState = n // Старое состояние
                let newState = cell.value.charAt(2) // Новое состояние
                transitions.push(oldValue + newValue + direction + oldState + newState) // Ложим все зачения в список состояний
            }
        }
    }
    startMachine(input, transitions) // Вызываем функцию запуска машины Тьюринга и передаем туда необходимые значения
})

/**
 * Вызов функции старта машины Тьюринга
 */

startMachine = (tape, states) => {
    let machine = new TuringMachine(tape, states)
    machine.start()
}
