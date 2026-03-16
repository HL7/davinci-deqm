~~~
{
  "resource": [
    {
      "type": "Measure",
      "supportedProfile": [
        "http://hl7.org/fhir/uv/cqm/StructureDefinition/cqm-measure"
      ],
      "interaction": [
        {
          "code": "read"
        }
      ],
      "operation": [
        {
          "name": "submit-data",
          "definition": "http://hl7.org/fhir/OperationDefinition/Measure-submit-data"
        },
        {
          "extension": [
            {
              "url": "http://hl7.org/fhir/uv/deqm/StructureDefinition/deqm-updateType",
              "valueCode": "incremental"
            }
          ]
        },{
          "extension": [
            {
              "url": "http://hl7.org/fhir/uv/deqm/StructureDefinition/deqm-updateType",
              "valueCode": "snapshot"
            }
          ]
        }
      ]
    }
    ...snipped content...
  ]
}
~~~
