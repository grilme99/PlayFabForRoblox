/* eslint-disable prettier/prettier */
import TestEZ from '@rbxts/testez'
const ReplicatedStorage = game.GetService('ReplicatedStorage')

const results = TestEZ.TestBootstrap.run([ReplicatedStorage], TestEZ.Reporters.TextReporter)
if (results.errors.size() > 0 || results.failureCount > 0) {
	error('Tests failed')
}
