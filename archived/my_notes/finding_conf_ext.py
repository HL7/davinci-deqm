from nested_lookup import nested_lookup
from pathlib import Path

my_document = Path(r'/Users/ehaas/Documents/FHIR/Davinci-DEQM/input/resources/capabilitystatement-consumer-client.json').read_text()

results = nested_lookup(
    key = '{"extension":[{"url":"http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation","valueCode":"MAY"}]}',
    document = my_document,
    wild = True,
    with_keys = True,
)

print(results)
