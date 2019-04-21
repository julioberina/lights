require 'ovto'

class MyApp < Ovto::App
  class State < Ovto::State
    item :bg, default: ''
  end

  class Actions < Ovto::Actions
    def set_bg(value:)
      return {bg: value}
    end

  end
  class MainComponent < Ovto::Component
    def render
      o 'div', align: 'center' do
        o 'h1', style: {fontFamily: "'Arial', sans-serif"} do
          o 'text', 'Light Switch'
        end

        o 'table' do
          o 'tr' do
            o 'td#box1', class: state.bg do 'Box 1' end
            o 'td#box2', class: state.bg do 'Box 2' end
            o 'td#box3', class: state.bg do 'Box 3' end
          end
        end

        o 'table', style: {paddingTop: '30px'} do
          o 'tr' do
            o 'button.redBtn', onclick: ->{ actions.set_bg(value: 'red') } do 'Red' end
          end
          o 'tr' do
            o 'button.blueBtn', onclick: ->{ actions.set_bg(value: 'blue') } do 'Blue' end
          end
          o 'tr' do
            o 'button.greenBtn', onclick: ->{ actions.set_bg(value: 'green') } do 'Green' end
          end
        end
      end
    end
  end
end

MyApp.run(id: 'ovto')
