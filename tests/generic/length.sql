{% test string_length(model, column_name,req_len) %}

    select *
    from {{ model }}
    where length({{ column_name }}) < {{req_len}} 

{% endtest %}