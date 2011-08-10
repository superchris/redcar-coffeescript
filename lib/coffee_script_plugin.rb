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
  
    def self.menus
      Redcar::Menu::Builder.build do
        sub_menu "Plugins" do
          sub_menu "CoffeeScript" do
            item "Compile and Display JS", :command => CompileAndDisplayCoffeeScript, :priority => 18
          end
        end
      end
    end
    def self.loaded
      Redcar::Declarations::Parser::DEFINITIONS[/\.coffee$/] = YAML.load(COFFEESCRIPT_YAML)
    end
    
    class CompileAndDisplayCoffeeScript < Redcar::Command 
      def execute
        win = Redcar.app.focussed_window
        tab = win.focussed_notebook.focussed_tab
        
        if tab && tab.document
          document = tab.document
          coffee_script_code = document.to_s
          
          # create temp file to store coffeescript code
          path = File.join(Redcar.user_dir, 'assets/tmpredcarfile.coffee')
          File.open(path, 'w+') do |f|
            f.write(coffee_script_code)
          end
          # store the compiled js
          output = `coffee -cp --bare #{path} 2>&1`
          File.delete(path) if File.exists?(path)
          
          controller = CompiledJavaScriptView.new(output)
          tab = win.new_tab(HtmlTab)
          tab.html_view.controller = controller
          tab.focus
        end
      end
    end
    
    private
    
    class CompiledJavaScriptView
      include HtmlController
      
      def initialize(compiled_js)
        @title = "CompiledJS"
        @compiled_javascript = compiled_js
      end
      
      def title
        @title
      end
      
      def index
        rhtml = ERB.new(File.read(File.join(File.dirname(__FILE__), "..", "views", "index.html.erb")))
        rhtml.result(binding)
      end
    end
  end
end