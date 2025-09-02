export enum ProfitCalculatorEvents {
  VIEWED = 'profit_calculator_viewed',
  STARTED = 'profit_calculator_started',
  STEP_COMPLETED = 'profit_calculator_step_completed',
  ABANDONED = 'profit_calculator_abandoned',
  SUBMITTED = 'profit_calculator_submitted', // Already exists, reuse it
  CALL_BOOKED = 'profit_calculator_call_booked', // If applicable post-submission
}
