/*
	rule.summary=Care-gaps operations SHALL use specified parameters.
	rule.description=Rule to ensure care-gaps operations SHALL use specified parameters.
	rule.param.periodStart.required=false
	rule.param.periodEnd.required=false
	rule.param.status.required=false
	rule.param.subject.required=false
	rule.param.organization.required=false
	rule.param.practitioner.required=false
	
*/

logger.info("periodStart: " + param.periodStart.toString())
logger.info("periodEnd: " + param.periodEnd.toString())
logger.info("status: " + param.status.toString())
logger.info("subject: " + param.subject.toString())
logger.info("organization: " + param.organization.toString())
logger.info("practitioner: " + param.practitioner.toString())

assert !param.periodStart.is(null) && !param.periodEnd.is(null) && !param.status.is(null) : "Request URL SHALL include periodStart AND periodEnd AND status. periodStart has the value of ${param.periodStart}, periodEnd has the value of ${param.periodEnd}, and status has the value of ${param.status}" 

assert !param.subject.is(null) || !param.organization.is(null) || (!param.practitioner.is(null) && !param.organization.is(null)) : "Request URL SHALL include subject OR organization OR practitioner and organization. subject has the value of ${param.subject}, organization has the value of ${param.organization}, and practitioner has the value of ${param.practitioner}"

