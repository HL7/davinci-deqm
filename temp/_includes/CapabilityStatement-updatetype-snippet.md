~~~
{
  "resource": [
    {
      "type": "Measure",
      "supportedProfile": [
        "http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/measure-cqfm"
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
              "url": "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-updateType",
              "valueCode": "incremental"
            }
          ]
        }
      ]
    }
    ...snipped content...
  ]
}
~~~
