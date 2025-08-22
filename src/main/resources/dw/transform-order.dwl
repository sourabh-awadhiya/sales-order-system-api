%dw 2.0
output application/json

fun parseLineItems(lineItemsJson) = 
    if (lineItemsJson != null and lineItemsJson != "")
        read(lineItemsJson, "application/json")
    else
        []

---
{
    orderId: payload.orderId,
    opportunityId: payload.opportunityId,
    customerName: payload.customerName,
    orderDate: payload.orderDate as DateTime,
    amount: payload.amount as Number,
    status: payload.status,
    lineItems: parseLineItems(payload.lineItems),
    notes: payload.notes default ""
}