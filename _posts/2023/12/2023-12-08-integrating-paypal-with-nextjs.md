---
title: "Integrating Paypal with Next.JS"
tags: React NextJS Typescript TailwindCSS
categories: Tech
---

Set up paypal sandbox environment using NextJS

## sign in paypal developer account

- Go to [Paypal Developer](https://developer.paypal.com/home) and register an account.
- Create a sandbox app and retrieve Client ID and
  Secret [here](https://developer.paypal.com/dashboard/applications/sandbox)
- create a file named `.env` in the project directory. and copy the following settings in the file.

```typescript
PAYPAL_CLIENT_ID = "<your-client-id>"
PAYPAL_CLIENT_SECRET = "<your-secret>"
NEXT_PUBLIC_PAYPAL_CLIENT_ID = "<your-client-id>"
```

- create another sandbox app and retrieve the email and password in the account info of that sandbox app.
- after click paypal button, enter the account info mentioned above to test the payment functionality.

## Implement paypal component

in components/paypal.tsx

```typescript
import React from "react";
import {
    PayPalButtons,
    PayPalScriptProvider,
    usePayPalScriptReducer,
} from "@paypal/react-paypal-js";

interface Order {
    id: string;
    // Add other order properties as needed
}

// interface OrderData {
//     // Add order data properties as needed
// }

async function createOrder(): Promise<string> {
    // replace this url with your server
    const response = await fetch(
        // replace this url with your server
        "/api/paypal/createOrder",
        {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            // use the "body" param to optionally pass additional order information
            // like product ids and quantities
            body: JSON.stringify({
                currency_code: 'AUD',
                value: '100.00'
            }),
        }
    );

    const order: Order = await response.json();

    console.log(order)

    // Your code here after creating the order
    return order.id;
}

async function onApprove(data: { orderID: string }): Promise<void> {
    // replace this url with your server
    const response = await fetch(
        // replace this url with your server
        "/api/paypal/captureOrder",
        {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                orderID: data.orderID,
            }),
        }
    );

    const orderData: Order = await response.json();
    console.log(orderData)


    // Your code here after capturing the order
}

// Custom component to wrap the PayPalButtons and show loading spinner
const ButtonWrapper: React.FC<{ showSpinner: boolean }> = ({showSpinner}) => {
    const [{isPending}] = usePayPalScriptReducer();

    return (
        <>
            {showSpinner && isPending && <div className="spinner"/>}
            <PayPalButtons
                fundingSource="paypal"
                style={{layout: "horizontal"}}
                disabled={false}
                forceReRender={[{layout: "horizontal"}]}
                createOrder={createOrder}
                onApprove={onApprove}
            />
        </>
    );
};
const Paypal: React.FC = () => {
    return (

        <PayPalScriptProvider
            options={{
                clientId: process.env["NEXT_PUBLIC_PAYPAL_CLIENT_ID"] as string,
                components: "buttons",
                currency: "AUD"
            }}
        >
            {/* <PayPalButtons fundingSource="paypal" style={{layout: "vertical", label: "donate"}} createOrder={createOrder} */}
            {/*                onApprove={onApprove}/> */}
            <ButtonWrapper showSpinner={false}/>
        </PayPalScriptProvider>

    );
};

export default Paypal;

```

## Implement backend checkout server

In pages/api/paypal/client.ts

```typescript
import checkoutNodeJssdk from "@paypal/checkout-server-sdk";

const configureEnvironment = () => {
    const clientId = process.env.PAYPAL_CLIENT_ID as string;
    const clientSecret = process.env.PAYPAL_CLIENT_SECRET as string;

    return process.env.NODE_ENV === "production"
        ? new checkoutNodeJssdk.core.LiveEnvironment(clientId, clientSecret)
        : new checkoutNodeJssdk.core.SandboxEnvironment(clientId, clientSecret);
};

const client = () =>
    new checkoutNodeJssdk.core.PayPalHttpClient(configureEnvironment());

export default client;
```

In pages/api/paypal/captureOrder.ts

```typescript
import type {NextApiRequest, NextApiResponse} from "next";
import paypal from "@paypal/checkout-server-sdk";

import client from "./client";


export default async function handler(
    req: NextApiRequest,
    res: NextApiResponse
) {
    if (req.method != "POST")
        return res.status(404).json({success: false, message: "Not Found"})


    // Capture order to complete payment
    const {orderID} = req.body;
    const PaypalClient = client();
    const request = new paypal.orders.OrdersCaptureRequest(orderID);
    const response = await PaypalClient.execute(request);
    if (!response) {
        res.status(500).json({success: false, message: "Some Error Occured at backend"});
    }

    // Your Custom Code to Update Order Status
    // And Other stuff that is related to that order, like wallet

    res.status(200).json({success: true, data: response.result});
}
```

In pages/api/paypal/createOrder.ts

```typescript
import type {NextApiRequest, NextApiResponse} from "next";
import paypal from "@paypal/checkout-server-sdk";

import client from "./client";

export default async function handler(
    req: NextApiRequest,
    res: NextApiResponse
) {

    if (req.method != "POST")
        return res.status(404).json({success: false, message: "Not Found"})

    const PaypalClient = client();
    // This code is lifted from https://github.com/paypal/Checkout-NodeJS-SDK
    const request = new paypal.orders.OrdersCreateRequest();

    request.headers["Prefer"] = "return=representation";
    request.requestBody({
        intent: "CAPTURE",
        purchase_units: [
            {
                amount: {
                    currency_code: req.body.currency_code,
                    value: req.body.value,
                },
            },
        ],
    });
    const response = await PaypalClient.execute(request);
    if (response.statusCode !== 201) {
        res.status(500).json({success: false, message: "Some Error Occured at backend"});
    }

    // Your Custom Code for doing something with order
    // Usually Store an order in the database like MongoDB

    res.status(200).json({success: true, id: response.result.id});
}
```
