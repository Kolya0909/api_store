json.devices @devices do |device|
    json.name device.name
    json.price device.price
    json.rating device.rating
    json.type device.type.name
    json.brand device.brand
end
