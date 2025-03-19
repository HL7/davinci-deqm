~~~
"group": [{
    "id": "group-1",
    "code": {
      "coding": [{
          "system": "http://example.org/group",
          "code": "group",
          "display": "group-1"
        }
      ]
    },
    "population": [{
        "id": "initial-population-1",
        "code": {
          "coding": [{
              "system": "http://terminology.hl7.org/CodeSystem/measure-population",
              "code": "initial-population",
              "display": "Initial Population"
            }
          ]
        },
        "criteria": {
          "language": "text/cql-identifier",
          "expression": "Initial Population"
        }
      }, {
        "id": "numerator",
        "code": {
          "coding": [{
              "system": "http://terminology.hl7.org/CodeSystem/measure-population",
              "code": "numerator",
              "display": "Numerator"
            }
          ]
        },
        "criteria": {
          "language": "text/cql-identifier",
          "expression": "Numerator"
        }
      }, {
        "id": "denominator",
        "code": {
          "coding": [{
              "system": "http://terminology.hl7.org/CodeSystem/measure-population",
              "code": "denominator",
              "display": "Denominator"
            }
          ]
        },
        "criteria": {
          "language": "text/cql-identifier",
          "expression": "Denominator"
        }
      }
    ],
    "stratifier": [{
        "id": "stratifier-1",
        "code": {
          "text": "Stratifier 1"
        },
        "criteria": {
          "language": "text/cql-identifier",
          "expression": "Stratifier 1"
        }
      }
    ]
  }
]
~~~
