trigger autoCaseAssignment on Case (before insert) {
	CaseAutomaticAssignment.autoassignCases(trigger.new);
}