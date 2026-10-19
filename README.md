# Capital Cities — iOS App

Uma aplicação iOS, desenvolvido com **UIKit e MapKit**, o app permite visualizar e consultar informações de 5 grandes capitais, acessando conteúdos da Wikipédia sem sair da aplicação.

O estudo corresponde ao **Project 16** do curso **100 Days of Swift**, de Paul Hudson, e também serviu como oportunidade para aprofundar a organização do código e o controle do fluxo de navegação.

## Explorando o mapa

- Navegação por cinco capitais: Londres, Oslo, Paris, Roma e Washington, D.C.
- Visualização das cidades em um mapa interativo
- Seleção de marcadores para consultar detalhes sobre cada capital
- Alternância entre as visualizações padrão, satélite e híbrida
- Acesso à página da Wikipédia de cada cidade por meio de uma WebView integrada

## Como o projeto foi organizado

A estrutura combina **MVVM** com o padrão **Coordinator**, mantendo os dados, a interface e a navegação em responsabilidades distintas.

## Escolhas de implementação

- **ViewCode:** interface construída programaticamente, sem depender de Storyboard.
- **MapKit:** mapa, coordenadas geográficas e anotações das capitais.
- **Anotações personalizadas:** a classe `CapitalCityAnnotation` associa cada marcador ao modelo da cidade correspondente.
- **UISegmentedControl:** troca direta entre os três tipos de mapa.
- **Closures:** comunicação da seleção de uma capital ao Coordinator.
- **WKWebView:** carregamento das páginas da Wikipédia dentro do app.
- **Navegação restrita:** a WebView permite a URL inicial autorizada, evitando navegações para endereços diferentes.
- **Injeção de dependência:** a ViewModel é fornecida à ViewController pelo inicializador.

## Evolução em relação ao tutorial

Além de implementar os desafios propostos, o projeto recebeu algumas decisões próprias:

- A navegação foi extraída para um Coordinator, em vez de ficar sob responsabilidade da ViewController.
- Os marcadores foram implementados com `MKMarkerAnnotationView`, permitindo personalização visual com a API moderna do MapKit.
- A escolha do tipo de mapa utiliza um controle segmentado, mantendo as opções visíveis e acessíveis durante a exploração.
- A seleção de uma cidade e a apresentação da Wikipédia foram desacopladas por meio de uma closure.
- A navegação da WebView foi limitada à página inicialmente autorizada.

## Tecnologias e conceitos

**Frameworks:** UIKit, MapKit e WebKit.

**Conceitos:** MVVM, Coordinator, ViewCode, injeção de dependência, closures, anotações de mapa, navegação com `UINavigationController` e separação de responsabilidades.

## Referência

Inspirado no **Project 16 — Capital Cities**, do curso 100 days of Swift criado por Paul Hudson.
