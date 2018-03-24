# encoding: utf-8

require_relative 'app'
require 'json'

def registrar_alumno
  RSpec.describe App do
    describe "1. Crear participante alumno: " do
      it '1.1 Conexión con backend' do
        test =App.new('')
        test.servicios('backend', 'test/conexion')
        expect(test.response.code).to eq(200)
      end
      it '1.2 Crear participante alumno' do
        data = {
          :id => '500',
          :evento_id => '5ab59224ef09516e7d000001',
          :correo_adicional => 'carlitossssssss@cabj.ar',
          :telefono_adicional => '819234-12312',
        }.to_json
        url = 'registro/alumno?data=' + data
        test = App.new(url)
        test.post()
        if test.response.code != 200 then
          puts test.response.body
        end
        #puts test.response.body
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado su participaci') #on
        expect(test.response.body).to include('success')
      end
    end
  end
end

def registrar_empleado
  RSpec.describe App do
    describe "2. Crear participante empleado: " do
      it '2.1 Conexión con backend' do
        test =App.new('')
        test.servicios('backend', 'test/conexion')
        expect(test.response.code).to eq(200)
      end
      it '2.2 Crear participante empleado' do
        data = {
          :id => '500',
          :evento_id => '5ab59224ef09516e7d000001',
          :correo_adicional => 'carlitossssssss@cabj.ar',
          :telefono_adicional => '819234-12312',
        }.to_json
        url = 'registro/empleado?data=' + data
        test = App.new(url)
        test.post()
        if test.response.code != 200 then
          puts test.response.body
        end
        #puts test.response.body
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('Se ha registrado su participaci') #on
        expect(test.response.body).to include('success')
      end
    end
  end
end

registrar_alumno
registrar_empleado
