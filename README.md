# Hubot Link

Make a hubot alias like ln

## Installation

Add hubot-link to your package.json, run npm install and add hubot-link to external-scripts.json.

Add hubot-link to your package.json dependencies.

    "dependencies": {
      "hubot-link": ">= 0.2.0"
    }

Add hubot-link to external-scripts.json.

    > cat external-scripts.json
    > ["hubot-link"]

## Usage

    me> hubot ln add pp "hubot ping"
    hubot> Add link: pp -> "hubot ping"
    me> hubot ln add echo-hello "hubot echo Hello"
    hubot> Add link: echo-hello -> "hubot echo Hello"
    
    me> hubot ln
    hubot> pp -> "hubot ping"
         > echo-hello -> "hubot echo Hello"
    
    me> hubot ln pp
    hubot> PONG
    me> hubot ln echo-hello World
    hubot> Hello World
    
    me> hubot ln rm pp
    hubot> Remove link: pp
