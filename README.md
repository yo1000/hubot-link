# Hubot Link

Make a hubot alias like ln

## Installation

Add hubot-link to your package.json, run npm install and add hubot-link to external-scripts.json.

Add hubot-link to your package.json dependencies.

    "dependencies": {
      "hubot-link": ">= 0.3.0"
    }

Add hubot-link to external-scripts.json.

    > cat external-scripts.json
    > ["hubot-link"]

## Usage

    me> hubot ln add p "ping"
    hubot> Add link: p -> "ping"
    me> hubot ln add e "echo Hello"
    hubot> Add link: e -> "echo Hello"
    
    me> hubot ln
    hubot> p -> "ping"
    e -> "echo Hello"
    
    me> hubot ln p
    hubot> PONG
    me> hubot ln e "World"
    hubot> HelloWorld
    
    me> hubot ln rm p
    hubot> Remove link: p
