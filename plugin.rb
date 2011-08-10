
Plugin.define do
  name    "coffeescript"
  version "1.0"
  file    "lib", "coffee_script_plugin"
  object  "Redcar::CoffeeScriptPlugin"
  dependencies "redcar", ">0", "textmate", ">0", "declarations", ">0", "auto_indenter", ">0", "html_view", ">0"
end