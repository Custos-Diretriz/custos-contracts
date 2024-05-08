import { newMockEvent } from "matchstick-as"
import { ethereum, BigInt, Address } from "@graphprotocol/graph-ts"
import {
  AgreementCreated,
  AgreementSigned,
  AgreementValid
} from "../generated/Agreement/Agreement"

export function createAgreementCreatedEvent(
  agreementId: BigInt,
  creator: Address,
  content: string
): AgreementCreated {
  let agreementCreatedEvent = changetype<AgreementCreated>(newMockEvent())

  agreementCreatedEvent.parameters = new Array()

  agreementCreatedEvent.parameters.push(
    new ethereum.EventParam(
      "agreementId",
      ethereum.Value.fromUnsignedBigInt(agreementId)
    )
  )
  agreementCreatedEvent.parameters.push(
    new ethereum.EventParam("creator", ethereum.Value.fromAddress(creator))
  )
  agreementCreatedEvent.parameters.push(
    new ethereum.EventParam("content", ethereum.Value.fromString(content))
  )

  return agreementCreatedEvent
}

export function createAgreementSignedEvent(
  agreementId: BigInt,
  signer: Address
): AgreementSigned {
  let agreementSignedEvent = changetype<AgreementSigned>(newMockEvent())

  agreementSignedEvent.parameters = new Array()

  agreementSignedEvent.parameters.push(
    new ethereum.EventParam(
      "agreementId",
      ethereum.Value.fromUnsignedBigInt(agreementId)
    )
  )
  agreementSignedEvent.parameters.push(
    new ethereum.EventParam("signer", ethereum.Value.fromAddress(signer))
  )

  return agreementSignedEvent
}

export function createAgreementValidEvent(
  agreementId: BigInt,
  firstpartyid: string,
  secondpartyid: string
): AgreementValid {
  let agreementValidEvent = changetype<AgreementValid>(newMockEvent())

  agreementValidEvent.parameters = new Array()

  agreementValidEvent.parameters.push(
    new ethereum.EventParam(
      "agreementId",
      ethereum.Value.fromUnsignedBigInt(agreementId)
    )
  )
  agreementValidEvent.parameters.push(
    new ethereum.EventParam(
      "firstpartyid",
      ethereum.Value.fromString(firstpartyid)
    )
  )
  agreementValidEvent.parameters.push(
    new ethereum.EventParam(
      "secondpartyid",
      ethereum.Value.fromString(secondpartyid)
    )
  )

  return agreementValidEvent
}
