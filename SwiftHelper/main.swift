#!/usr/bin/swift

//  Created by Eduardo Oliveira and Larissa Uchôa on 10/03/20.

import Foundation

// Checar se o arquivo txt está vazio ou não, utilizada na função checkLevel
func ifLevel(level: String) -> Bool {
    if (level.isEmpty) {
        return  false
    }
    return true
}

// Busca o caminho da pasta de Documentos do usuário, utilizada na função checkLevel
func getDocumentsDiretory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

// Lê o contéudo do .txt retornando uma variável que contém o conteúdo, utilizada na função checkLevel
func readFile(filepath: URL ) -> String {
    var content = ""
    do {
        content = try String(contentsOf: filepath, encoding: .utf8)
    } catch {
        
    }
    return content
}

// Escreve no .txt o nível recebido no input do usuário, utilizada na função checkLevel
func writeFile(filepath: URL, level: String) {
    do {
        try level.write(to: filepath, atomically: true, encoding: .utf8)
    }
    catch {/* error handling here */}
}

// Valida o input do usuário na interface, sendo chamada na função checkLevel
func askLevel() -> String {
    var lvl = ""
    while let str = readLine(strippingNewline: true) {
        if( str == "1" || str == "2" || str == "3" ){
            lvl = str
            break
        } else {
            print("\u{001B}[0;37mOs níveis disponíveis são:\u{001B}[0;32m 1- Fácil\u{001B}[0;33m 2- Intermediário\u{001B}[0;31m 3- Avançado")
            print("\u{001B}[0;37mDigite uma opção válida")
        }
    }
    return lvl
}

// É a função que define ou redefine o nível do usuário em Swift
func checkLevel(isRedefine: Bool) -> String {
    // Salva o caminho do .txt em uma variável, e caso não exista o arquivo ele é criado
    let filepath = getDocumentsDiretory().appendingPathComponent("nivel.txt")

    // Lê o conteúdo do .txt (nível do usuário) e salva em uma variável
    var nivel = readFile(filepath: filepath)
    
    // Utiliza o parâmetro para definir o texto que será exibido para o usuário
    if isRedefine {
        // Caso já possua um nível no arquivo e o usuário decida redefinir será realizado as funções abaixo
        print("\u{001B}[0;37mRedefina seu nível de conhecimento em Swift: ")
        print("\u{001B}[0;37mOs níveis disponíveis são:\u{001B}[0;32m 1- Fácil\u{001B}[0;33m 2- Intermediário\u{001B}[0;31m 3- Avançado\u{001B}[5;37m")
        
        // Salva o nível em uma variável
        nivel = askLevel()
        print("\u{001B}[0;37m")
        
        // Limpa a tela do terminal
        clear()
        
        // Sobrescreve o nível do usuário no .txt
        writeFile(filepath: filepath, level: nivel)
    } else {
        // Caso o arquivo esteja vazio será realizado as funções abaixo
        if !ifLevel(level: nivel) {
            print("Insira seu nível de conhecimento em Swift: ")
            print("\u{001B}[0;37mOs níveis disponíveis são:\u{001B}[0;32m 1- Fácil\u{001B}[0;33m 2- Intermediário\u{001B}[0;31m 3- Avançado\u{001B}[5;37m")
            
            // Salva o nível do usuário em uma variável
            nivel = askLevel()
            print("\u{001B}[0;37m")
            
            // Limpa o terminal
            clear()
            
            // Escreve o nível do usuário no .txt
            writeFile(filepath: filepath, level: nivel)
        }
    }
    return nivel
}

// Função que realiza a limpeza da tela do terminal
func clear() {
    let p = Process()
    p.launchPath = "/usr/bin/clear"
    p.launch()
    p.waitUntilExit()
}

// Estrutura que possui o conteúdo e as ilustrações do programa, e realiza o controle delas.
struct Level {
    var frases: [[String]] = [
        ["0",
            """
            A linguagem Swift foi apresentada no dia 02 de junho de 2014, criada por Chris
            Lattner o mesmo desenvolvedor da LLVM. Seu desenvolvimento consistiu de 4 anos em
            total segredo, ninguém fora da Apple sabia sobre a criação de uma nova linguagem.
            """,
            """
            Swift foi criado pensando na melhor performance possível, sendo 2.6x mais rápido
            que Objective-C e 8.4x mais rápido do que Python 2.7.
            """,
            """
            Swift é uma linguagem open source, isso significa que a comunidade de desenvolvedores
            pode contribuir no seu desenvolvimento. Além disso, através da comunidade é
            desenvolvido vários ports para outras plataformas, atualmente, Swift já possui um port
            para Linux, e se espera que na versão 5.3 seja lançado o port para Windows.
            """,
            """
            A Apple lançou na WWDC 2019 o framework SwiftUI, que é um novo modo de criar UIs para
            aplicativos de Swift, que busca diminuir e simplificar ainda mais o código. Para tal,
            o SwiftUI usa módulos gráficos para inserir segmentos de código, adicionando as linhas
            à medida que elas se expandem.
            """,
            """
            O Swift Playgrounds é um aplicativo revolucionário para iPad e Mac que torna o
            aprendizado do Swift interativo e divertido. Como não requer conhecimento de
            programação, é perfeito para os alunos que estão começando aprenderem o básico usando
            o Swift, através da resolução de quebra-cabeças. Assuma uma série de desafios e avance
            para playgrounds mais avançados, projetados pela Apple e outros desenvolvedores líderes.
            """,
            """
            WWDC é a conferência oficial da Apple para desenvolvedores. O evento acontece
            tradicionalmente no segundo trimestre do ano, em San Francisco, EUA, e marca a chegada
            de várias novidades da marca no decorrer do ano. Dentre elas, é comum a revelação de
            novas versões do sistema operacional macOS, que equipa a linha de computadores Mac, e
            grandes atualizações da sua versão móvel, iOS. Além disso, todos os anos a Apple
            aproveita a encontro para apresentar novos equipamentos.
            """
        ],
        ["1",
            """
            - Quer concatenar texto com Strings? Para String basta usar o operador ‘+’
            Ex:
                var dificuldade: String = "fácil"
                var texto: String = "Aprender Swift é "  + dificuldade + "!"
                print(texto) // Aprender Swift é fácil
            """,
            """
            - Quer concatenar texto com variáveis que não sejam Strings?
            Para isso, coloque a variável dentro de um \\()
            Ex:
                var versao: Int = 5
                var texto: String = "A versão recente do Swift é a \\(versao)
                print(texto) // A versão recente do Swift é a 5
            """,
            """
            - Não crie variáveis sem necessidade!
            Cada variável pega um pouco de memória, e muitas variáveis podem gerar muita dor
            de cabeça mais pra frente. Caso um loop não utilize a variável, por exemplo:
            Ex:
                for _ in 1...5 {
                    print("Swift")
                } // o _ substitui a variável que seria declarada ali
            """,
            """
            - Enums são úteis para definir o escopo de valores de uma variável.
            Mas perdemos muito de seu poder quando usamos Strings como identificadores, pelo
            tempo de processamento. Uma boa prática é usar as palavras como atributos do enum
            e já as relacionarmos com os valores. Além dos valores ficarem salvos no
            autocomplete do XCode, evitando erros de digitação.
            Ex:
                enum People:Double {
                        case adult = 7.0
                        case child = 3.0
                }
                var person = People.adult
                person.rawValue // 7.0
            """,
            """
            - Nil é um poderoso aliado para otimizar e simplificar o código.
            A coalescência do nil permite que possamos passar o valor de uma variável para
            outra, testar se a primeira possui algum valor, e passar outro valor caso o teste
            seja falso, sem usar nenhum ‘if’. Tudo isso numa linha de código só!

                var userCustomColor: UIColor?
                let defaultColor: UIColor.Red
                let colorForLayout: UIColor!
                colorForLayout = userCustomColor ?? defaultColor // atribuição, teste e outra atribuição
            """,
            """
            - Nil é um poderoso aliado para otimizar e simplificar o código.
            A coalescência condicional do nil permite que possamos fazer testes pontuais na
            hora da atribuição de valores, sem utilizar ‘if’ e ‘else’. Tudo isso numa linha de
            código só!
            
                let currentSalary = 6000
                let isSenior = true
                let finalSalary = 0
                finalSalary = currentSalary + (isSenior ? 4500 : 0) // 10500
            """,
            """
            - Typecasting é um uso de Optional para checar qual a classe do objeto.
            Com a herança, podemos colocar objetos diferentes com herança em comum numa mesma
            estrutura, e utilizando o ‘as?’ podemos realizar operações dependendo de que
            classe aquele objeto pertence.
            Ex:
                class Animal {}
                class Fish: Animal {}
                class Dog: Animal {}
                let pets = [Fish(), Dog(), Fish(), Dog()]
                for pet in pets {
                    if let dog = pet as? Dog {
                        … // esse trecho executa caso o objeto seja da classe Dog
                    }
                }
            """,
            """
            - Herança é um meio de estruturar seu código de modo que algumas classes possam
            herdar atributos e métodos de outras. É parte do paradigma da programação
            orientada ao objeto.
            Ex:
                class Animal {
                    func andar () {
                        print("Andou!")
                    }
                }
                class Dog: Animal {}
                var dog = Dog()
                dog.andar() // Executa a função com se fosse própria
            """
        ],
        ["2",
            """
            - Classes possuem funcionalidades que as structs não possuem!
                - A herança permite uma classe herdar características de outra classe.
                - Deinitializers permitem que a instância de uma classe libere recursos que foram
                designados para ela.
                - Reference counting permite mais de uma referência para uma instância de uma classe.
            """,
            """
            - Extensions permitem que você adicione funcionalidades para objetos já existentes.
            Usar extensions pode te poupar de criar variáveis apenas para guardar valores, por
            exemplo.
            Ex:
                extension Int {
                    var squared: Int { return self * self }
                }
                5.squared // 25, geralmente seria criada uma variável recebendo valor de uma função

            """,
            """
            - Generics são um meio de deixar seu código mais flexível, com funções que sirvam para
            vários tipos diferentes. É essencial buscar legibilidade e flexibilidade pro seu código.
            Ex:
                func printElementFromArray<T>(array: [T]) {
                    for element in array {
                        print(element)
                    }
                } // Funciona para arrays de qualquer tipo

            """,
            """
            - Precisa de um validador?
            Evite aquela série de ‘ifs’ para cada teste. Que tal usar o guard let? Podemos fazer
            todos testes nele e caso tenha algum erro, ele retorna um nil.
            Ex:
                var password: String?
                var name: String?
                func makeSignUp() {
                    guard let pass = password let n = name else { return }
                    print ("Bem Vindo, \\(n)!")
                }
            """,
            """
            - Podemos operar variáveis através de properties, tirando a necessidade de criar
            algumas funções. Um exemplo de como get e set podem ser utilizadas para manipular
            outras variáveis.
            Ex:
                var radius: Double = 10
                var diameter: Double {
                        get { return radius * 2 }
                        set { radius = newValue / 2}
                }
                radius // 10.0
                diameter = 1000
                radius // 500.0
            """,
            """
            - Opte por programação funcional sempre que possível.
            Reduz a quantidade de código e de memória alocada com variáveis, além de aumentar sua
            proficiência na linguagem.
            Ex:
                let items =  Array(1...10)
                var result = items.filter{ $0 % 2 == 0}
                print(result) // [2, 4, 6, 8, 10]
            """,
        ],
        ["3",
            """
            - Closures possuem uma sintaxe mais compacta do que funções. Considere usá-los para
            despoluir um pouco o código.
            Ex:
                var sum:(Int, Int) -> (Int) = {
                    $0 + $1
                }
                sum(2, 3) // 5
            """,
            """
            - Closures podem ter sua sintaxe reduzida, usando a ordem em que os parâmetros foram
            estabelecidos como nomes das variáveis internas.
            Ex:
                travel {
                    "Estou indo para \\($0) no meu carro"
                }
            """
        ]
    ]
    
    var ilustracao: [[String]] = [
        ["0",
"""
                          @@@
                      @@@@@@@
                    @@@@@@@
                    @@@
          @@@@           @@@@
     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(
 &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
       @@@@@@@@@@@@@@@@@@@@@@@@@@@*
         @@@@@@@@@.    @@@@@@@@@
"""
        ],
        ["1",
"""
(............................,,,,,,,,,,,,****#
(......  ............,,,,,,,,,,,,,,,,,,,,,,,*/
(....(##(((((#(((((/////////////*/********,,,(
(....#                                  *,,**(
(....#                                  ,.,,*#
(....#           @        @@            ,.,,*#
(...,#          @  @@      @@@          ,,***#
(...,#            @@@@@@   @@@@         ,,*,*#
(.,,,%               @@@@@@@@@@         ,,,**#
(.,,,%        @        @@@@@@@@         ,,***#
(.,,,#          @@@@@@@@@@@@@@@@        ,,***%
(.,,*#                        @@@       ,,***%
(.,,*#                                  ,****%
(.,,*/*,,................................****,
(.,,,,,,,,,,,,*,*****************************,
(.,,,,,,,,,,,,,***********************//////*,
(.,,,**,,,,,,*,*******                  **//*,
(,,,,,,*,,,,,********************//(((((,*//*,
(,,,,,,,,,,,,********************///////////*,
#,,,,,,,,,,,,,,*****************////////////*,
(,,****************************************//,
 (*//(((((((((((((((((((((((((((((((((((#(((
 (*///((/////(//////(((/(((((((((((((#%%(((/
 #*/////////////////////////(/((/(/((((((/(/
"""
        ],
        ["2",
"""
  ./****************************************,
 **  @@&@&&&&&&&&&&&&&&&&&&@@@@@@@@&&&&&&&, ,*
 ,/  @                                   &, ,/
 ,/  @          @        @@              &, ,/
 ,/  @         @  @@      @@@            &, ,/
 ,/  @           @@@@@@   @@@@           &, ,/
 ,/  @              @@@@@@@@@@           &, ,/
 ,/  @        @       @@@@@@@@           &, ,/
 ,/  @         @@@@@@@@@@@@@@@@          &, ,*
 ,/  @                       @@@         &, ,*
 ,/  @                                   &, ,*
 ./  @@@@@&&&&&&&&&&@&&&&&&&&&&&&&&&&&&&@@,.,/
 ./.......,...,........,...,...,...,...,....*/
                  ... (/...
                 *           ,
              /.       .,      .,
             ,....           ....,
            *,....................,
            /,...................,*
"""
        ],
        ["3",
"""
,..............................................
*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&%.
*@                                           %.
*@               @        @@                 %.
*@              @  @@      @@@               %.
/@                @@@@@@   @@@@              %.
/@                   @@@@@@@@@@              %.
/@             @       @@@@@@@@              %.
/@              @@@@@@@@@@@@@@@@             %.
/@                            @@@            %.
/@                                           %.
/@                                           %.
,%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/,
,..............................................
,.....................@@&......................
*,............................................,
                 *************
                #(((((((((((((/
               ,,.............,,
"""
        ]
    ]
    
    var difficulty: Int
    
    // A variável é inicializada com um valor 0 para que seja preenchida com o input do usuário ou com o valor do arquivo .txt depois.
    init() {
        difficulty = 0
    }
    
    // Recebe o nível (String) que estava no .txt e o designa para variável difficulty como inteiro
    mutating func levelInt(level: String) {
        difficulty = Int(level)!
        defineLevel()
    }
    
    // Define a cor da ilustração de acordo com o nível/dificuldade do usuário
    func defineColor() {
        switch difficulty {
        case 1:
            print("\u{001B}[0;32m")
        case 2:
            print("\u{001B}[0;33m")
        case 3:
            print("\u{001B}[0;31m")
        case 0:
            print("\u{001B}[0;36m")
        default:
            print("\u{001B}[0;37m")
        }
    }
    
    // Controla o que vai ser exibido na interface
    mutating func defineLevel() {
        // Utiliza um randomizador para definir se será exibido um dado técnico ou curiosidades gerais sobre Swift.
        let random = Int.random(in: 1...100)
        if random > 80 {
            difficulty = 0
        }
        // Seleciona a frase que será exibida de forma aleatória e a printa.
        let y = frases[difficulty].count
        let x = Int.random(in: 1..<y)
        print(frases[difficulty][x])
        
        // Define a ilustração e a cor de acordo com o nível, e printa na tela.
        defineColor()
        print(ilustracao[difficulty][1])
    }
    
}

// Controla o input do usuário dentro da interface principal
func controlMenu(menuIndex: String){
    switch menuIndex {
    case "1":
        // Caso o usuário digite "1" será recarregado o programa
        print("Carregando...")
    case "2":
        // Caso o usuário digite "2" será chamado o checkLevel para redefinir seu nível
        let _ = checkLevel(isRedefine: true)
    case "3":
        // Limpa o terminal e sai do programa
        clear()
        exit(0)
    default:
        print("Easter Egg 👽")
    }
}

// Interface principal printada na tela
func menu () {
    print("\n\u{001B}[7;37m")
    print("+----------------------------------------------+")
    print("|  1-) Mostrar mais                            |")
    print("|  2-) Redefinir                               |")
    print("|  3-) Sair                                    |")
    print("+----------------------------------------------+")
    print("\n\u{001B}[0;37m")
}

// Instancia o Level que contém a interface e o conteúdo.
var lvl = Level()

// Limpa o terminal
clear()

while(true) {
    // Checa o nível do usuário e salva em uma variável
    let swiftLevel = checkLevel(isRedefine: false)
    
    // Transforma a variável que contém o nível em inteiro e configura a interface do programa.
    lvl.levelInt(level: swiftLevel)
    
    // Printa o menu principal
    menu()
    
    // Recebe o input do usuário em relação ao menu principal
    while let str = readLine(strippingNewline: true) {
        
        // Faz a validação do input do usuário
        if( str == "1" || str == "2" || str == "3" ){
            // Chama a função controlMenu para realizar o controle de tela
            controlMenu(menuIndex: str)
            // Limpa a tela
            clear()
            print("\u{001B}[0;37m")
            
            break
            
        } else {
            print("\u{001B}[0;37mDigite uma opção válida")
        }
    }
}
