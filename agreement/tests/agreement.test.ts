import {
  assert,
  describe,
  test,
  clearStore,
  beforeAll,
  afterAll
} from "matchstick-as/assembly/index"
import { BigInt, Address } from "@graphprotocol/graph-ts"
import { AgreementCreated } from "../generated/schema"
import { AgreementCreated as AgreementCreatedEvent } from "../generated/Agreement/Agreement"
import { handleAgreementCreated } from "../src/agreement"
import { createAgreementCreatedEvent } from "./agreement-utils"

// Tests structure (matchstick-as >=0.5.0)
// https://thegraph.com/docs/en/developer/matchstick/#tests-structure-0-5-0

describe("Describe entity assertions", () => {
  beforeAll(() => {
    let agreementId = BigInt.fromI32(234)
    let creator = Address.fromString(
      "0x0000000000000000000000000000000000000001"
    )
    let content = "Example string value"
    let newAgreementCreatedEvent = createAgreementCreatedEvent(
      agreementId,
      creator,
      content
    )
    handleAgreementCreated(newAgreementCreatedEvent)
  })

  afterAll(() => {
    clearStore()
  })

  // For more test scenarios, see:
  // https://thegraph.com/docs/en/developer/matchstick/#write-a-unit-test

  test("AgreementCreated created and stored", () => {
    assert.entityCount("AgreementCreated", 1)

    // 0xa16081f360e3847006db660bae1c6d1b2e17ec2a is the default address used in newMockEvent() function
    assert.fieldEquals(
      "AgreementCreated",
      "0xa16081f360e3847006db660bae1c6d1b2e17ec2a-1",
      "agreementId",
      "234"
    )
    assert.fieldEquals(
      "AgreementCreated",
      "0xa16081f360e3847006db660bae1c6d1b2e17ec2a-1",
      "creator",
      "0x0000000000000000000000000000000000000001"
    )
    assert.fieldEquals(
      "AgreementCreated",
      "0xa16081f360e3847006db660bae1c6d1b2e17ec2a-1",
      "content",
      "Example string value"
    )

    // More assert options:
    // https://thegraph.com/docs/en/developer/matchstick/#asserts
  })
})
