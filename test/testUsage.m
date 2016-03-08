addpath('lib', 'test')

schema = struct('type', 'object')

[obj, errors] = JSON.parse('file:document.json', 'file:schema.json')
[obj, errors] = JSON.parse('{"foo": 1, "bar": 2}', schema)

obj = struct('foo', 1, 'bar', 2)
[json, errors] = JSON.stringify(obj, 'file:schema.json')
[json, errors] = JSON.stringify(obj, schema)

stringifier = JSON_Stringifier()
stringifier.formatters('date') = @(x) JSON_Handler.datenum2string(x)
stringifier.formatters('date-time') = @(x) JSON_Handler.datetimenum2string(x)
