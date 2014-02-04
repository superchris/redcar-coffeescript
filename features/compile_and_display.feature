Feature: Compile and Display JavaScript
  In order to check my coffeescript code, and see the javascript it will turn into
  as a user
  I will compile it and display the output using RedCar
  
  Scenario: Properly formatted coffeescript file
    Given the content is:
        """
        $ ->
          alert('hello')
        """
        
    When I run the command Redcar::CoffeeScriptPlugin::CompileAndDisplayCoffeeScript
    Then the preview should display:
        """
        $(function() {
          return alert('hello');
        });
        """
    