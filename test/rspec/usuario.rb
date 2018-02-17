# encoding: utf-8

require_relative 'app'
require 'json'

def nombre_repetido
  RSpec.describe App do
    describe "1. Validar nombre repetido: " do
      it '1.1 Conexión con backend' do
        test =App.new('')
        test.servicios('backend', 'test/conexion')
        expect(test.response.code).to eq(200)
      end
      it '1.2 Validar nobmre repetido - es repetido' do
        data = 'pips'
        url = 'registro/validar_usuario_repetido?nombre=' + data
        test =App.new(url)
        test.post()
        #puts test.response.body
        expect(test.response.code).to eq(200)
        expect(test.response.body).to eq('1')
      end
      it '1.3 Validar nobmre repetido - no es repetido' do
        data = 'pips123'
        url = 'registro/validar_usuario_repetido?nombre=' + data
        test =App.new(url)
        test.post()
        #puts test.response.body
        expect(test.response.code).to eq(200)
        expect(test.response.body).to eq('0')
      end
    end
  end
end

nombre_repetido