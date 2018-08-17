# Game Lovers App
Game Lovers App

Linguagem: Swift</br>
Versão: iOS 11</br>

[imagens]

## Informações Gerais

### Recursos utilizados

<b>Observação</b>: Todos as dependências utilizadas no projeto já estão integradas, não precisa reinstalar.

#### Gerenciador de dependências
<b>Cocoapods</b>

Pods utilizados:
- Alamofire - versão: 4.7
- SwiftyJSON - versão: 4.0
- Kingfisher - versão: 4.6
- UIScrollView-InfiniteScroll - versão: 1.0
- Parchment - versão: 1.1

<b>Motivos</b>
- Alamofire: Para fazer as requisições na web. Motivo: Uma das depências mais utilizadas pela comunidade com alta qualidade e sempre atualizada.
- SwiftyJSON: Para parcear o JSON. Motivo: Simplicidade de parcear JSON, e ainda, possibilita garantir valor opcional caso o atributo venha nulo.
- Kingfisher: Para fazer o download da imagem e gerenciar o cache da imagem. Motivo: Dependência leve para fazer download e cahce de imagens da internet.
- UIScrollView-InfiniteScroll: Para controlar o infity scroll.
Motivo: Facilidade em criar scroll infinito assíncrono.
- Parchment: Para criar as tabs superiores presentes na tela home. Motivos: Eficiência no consumo de memória, possibilidade de scroll infinito e facilidade de customização.

#### Arquitetura
<b>MVVM<b></br>
Devido a simplicidade de implementação em relação a outras arquiteturas como VIPER e VIP (Clean Architecture), contribuindo para a separação de responsabilidades, principalmente, reduzindo a carga de responsabilidade da ViewController.

### Importante!
Necessitária um pouco mais de tempo para pesquisar, testar e aplicar as seguintes melhorias citadas abaixo, pois agregaria muito numa possível evolução do aplicativo e na construção futuros apps:
- Reduzir o acomplamente entre algumas classes, modificando a arquitetura;
- Melhorar o controle dos grupos de requisições;
- Aplicar outro formato de injeção de dependência entre classes e principalmente entre telas;
- Deixar as view "burras", com isso, reduzir a responsabilidade da view, melhorando o controle sobre a view e possibilitando criar diversos testes para verificar o comportamento da view;
- Criar os teste unitários de tela e UI em todo o aplicativo para contribuir com a qualidade, legibilidade, mantenabilidade e garantir que as antigas funcionalidades continuem funcionando após criar novas funcionalidades.
