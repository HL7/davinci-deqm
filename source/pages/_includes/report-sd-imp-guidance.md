- The `MeasureReport.group.population.id` is a must support element because it is used to link across the Measure and is equal to the `Measure.population.group.id. This is needed because the `MeasureReport.group.population.code` is insufficient when the measure types have multiple populations with the same code.

- If the measure scoring type is 'proportion','ratio', or 'continuous-variable' then the improvementNotation element is required.
