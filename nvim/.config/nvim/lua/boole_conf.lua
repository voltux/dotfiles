require('boole').setup({
    mappings = {
        increment = '<C-a>',
        decrement = '<C-x>',
    },
    -- Key value pairs of additional replacements
    -- increment: (key => value)
    -- decrement: (value => key)
    pair_additions = {
        ['Foo'] = 'Bar',
        ['Bar'] = 'Foo',
    },
})
