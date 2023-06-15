{%- macro load_dev_data(dev_days_of_data=3) %}
{% if target.name == 'dev' %}
  where _etl_loaded_at >= dateadd('day', -{{dev_days_of_data}} , current_timestamp()) 
{% endif %}  
{% endmacro %}