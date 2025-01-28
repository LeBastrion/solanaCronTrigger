# Delete Webhook

#### Programatically delete a Helius webhook.

## Deletes a webhook.

```
DELETE https://api.helius.xyz/v0/webhooks/{webhookID}
```
#### Path parameters

#### webhookID* string

```
The webhook ID.
```
#### Query parameters

#### api-key* string

```
The api key.
```
#### Response^200

```
No content.
```
#### Request JavaScript

```
Test it
```
#### Response^400

```
const response = await fetch('https://api.helius.xyz/v0/webhooks/{webhook
method: 'DELETE',
headers: {},
});
const data = await response.json();
```
## DELETE /webhooks/:webhookID


```
const deleteWebhook = async () => {
try {
const response = await fetch(
"https://api.helius.xyz/v0/webhooks/<webhook-id>?api-key=<PASTE YOU
{
method: 'DELETE',
headers: {
'Content-Type': 'application/json',
},
}
);
const data = await response.json();
console.log({ data });
} catch (e) {
console.error("error", e);
}
};
deleteWebhook();
```
## Code Example