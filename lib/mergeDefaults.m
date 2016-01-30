% COPYRIGHT Wolfgang Kuehn 2016 under the MIT License (MIT).
% Origin is https://github.com/decatur/ansatz27.

function mergedObject = mergeDefaults(object, schema)
mergedObject = object;

if ~isfield(schema, 'properties')
    return
end

properties = schema.properties;
propertyNames = fieldnames(properties);

for i=1:length(propertyNames)
    name = propertyNames{i};
    property = properties.(name);
    if isfield(property, 'default') && ~isfield(mergedObject, name)
        mergedObject.(name) = property.default;
    end
end
end