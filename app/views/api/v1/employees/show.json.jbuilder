json.partial! @employee
json.set! :project do
    json.partial! partial: 'api/v1/commons/common', common: @employee.project
end    
