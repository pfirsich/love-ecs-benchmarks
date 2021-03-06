package.path = package.path .. ";./?.lua;./?/init.lua;./init.lua"

local HooECS = require('HooECS')
HooECS.initialize({ globals = true })

describe('Component', function()
    it(':create with defaults creates a Component with default values', function()
        local c = HooECS.Component.create('TestComponent',
          {'defaultField', 'emptyField'},
          {defaultField = 'defaultValue'})

        local instance = c()
        assert.are.equal(instance.defaultField, 'defaultValue')
        assert.is_nil(instance.emptyField)
    end)

    it(':load returns the specified components', function()
        local c1 = Component.create('TestComponent1')
        local c2 = HooECS.class('TestComponent2')
        Component.register(c2)
        local c3 = HooECS.class('TestComponent3')

        local loaded1, loaded2, loaded3 = Component.load({
            'TestComponent1', 'TestComponent2', 'TestComponent3'
        })

        assert.are.equal(loaded1, c1)
        assert.are.equal(loaded2, c2)
        assert.is_nil(loaded3)
    end)
end)
