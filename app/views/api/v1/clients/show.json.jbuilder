json.partial! partial: 'api/v1/commons/common', common: @client
json.set! :projects do
    json.array! @client.projects do |project|
        json.partial! partial: 'api/v1/commons/common', common: project
    end       
end
json.set! :employees do
    json.array! @client.employees do |employee|
        json.partial! employee
    end
end
