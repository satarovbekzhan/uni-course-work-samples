class TuringMachine {

    tape = []
    states = []

    index = 0
    state = 1

    constructor(tape, states) {
        this.tape = tape
        this.states = states
    }

    start = () => {
        while (this.state != 0) {
            this.move()
        }
        /*this.tape.forEach(e => {
            console.log(e + "\n")
        })*/
        alert(this.tape.join(" "))
    }

    move = () => {
        let currentState = ""
        this.states.forEach(s => {
            if (s !== "") {
                if (s.charAt(0) === this.tape[this.index] && parseInt(s.charAt(3)) === this.state) {
                    currentState = s
                }
            }
        })
        this.tape[this.index] = currentState.charAt(1)
        if (currentState.charAt(2) === ">") {
            this.index += 1
        } else if (currentState.charAt(2) === "<") {
            this.index -= 1
        }
        this.state = parseInt(currentState.charAt(4))
    }
}
