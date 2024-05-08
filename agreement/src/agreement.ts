import {
  AgreementCreated as AgreementCreatedEvent,
  AgreementSigned as AgreementSignedEvent,
  AgreementValid as AgreementValidEvent
} from "../generated/Agreement/Agreement"
import {
  AgreementCreated,
  AgreementSigned,
  AgreementValid
} from "../generated/schema"

export function handleAgreementCreated(event: AgreementCreatedEvent): void {
  let entity = new AgreementCreated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.agreementId = event.params.agreementId
  entity.creator = event.params.creator
  entity.content = event.params.content

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleAgreementSigned(event: AgreementSignedEvent): void {
  let entity = new AgreementSigned(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.agreementId = event.params.agreementId
  entity.signer = event.params.signer

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleAgreementValid(event: AgreementValidEvent): void {
  let entity = new AgreementValid(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.agreementId = event.params.agreementId
  entity.firstpartyid = event.params.firstpartyid
  entity.secondpartyid = event.params.secondpartyid

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}
