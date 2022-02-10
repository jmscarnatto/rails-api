json.set! :projects do 
    json.array! @projects do |project|
        json.partial! partial: 'api/v1/commons/common', common: project
        json.client project.client.id
        json.set! :employees do
            json.array! project.employees do |employee|
               json.partial! employee
            end
        end    
    end
end
