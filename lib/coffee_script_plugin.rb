module Redcar
  # This class is your plugin. Try adding new commands in here
  # and putting them in the menus.
  class CoffeeScriptPlugin
  COFFEESCRIPT_YAML=<<-YAML
  - regex:    "class\\s+([A-Z]\\w*)"
    capture:  1
    type:     id
    kind:     class
  - regex:    "(\\w+)\\s*\\:\\s*(\\(.*\\))?\\s*->"
    capture:  1
    type:     id
    kind:     method
  YAML
  
    def self.loaded
      Redcar::Declarations::Parser::DEFINITIONS[/\.coffee$/] = YAML.load(COFFEESCRIPT_YAML)
    end
  end
end