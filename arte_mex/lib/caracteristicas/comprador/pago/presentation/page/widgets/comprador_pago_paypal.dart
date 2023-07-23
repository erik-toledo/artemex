import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
//import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:google_fonts/google_fonts.dart';

class CompradorPagoPayPal extends StatefulWidget {
  final String clientId;
  final String secretKey;
  final double ancho;
  final double alto;
  const CompradorPagoPayPal(
      {super.key,
      required this.clientId,
      required this.secretKey,
      required this.ancho,
      required this.alto});

  @override
  State<CompradorPagoPayPal> createState() => _CompradorPagoPayPalState();
}

class _CompradorPagoPayPalState extends State<CompradorPagoPayPal> {
  @override
  Widget build(BuildContext context) {
    final clientId = widget.clientId;
    final secretKey = widget.secretKey;
    // final double ancho = widget.ancho;
    // final double alto = widget.ancho;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: widget.ancho,
        height: widget.alto / 13,
        child: ElevatedButton(
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => UsePaypal(
                  sandboxMode: true,
                  clientId: clientId,
                  secretKey: secretKey,
                  returnURL: "https://samplesite.com/return",
                  cancelURL: "https://samplesite.com/cancel",
                  transactions: const [
                    {
                      "amount": {
                        "total": '10.12',
                        "currency": "USD",
                        "details": {
                          "subtotal": '10.12',
                          "shipping": '0',
                          "shipping_discount": 0
                        }
                      },
                      "description": "The payment transaction description.",
                      // "payment_options": {
                      //   "allowed_payment_method":
                      //       "INSTANT_FUNDING_SOURCE"
                      // },
                      "item_list": {
                        "items": [
                          {
                            "name": "A demo product",
                            "quantity": 1,
                            "price": '10.12',
                            "currency": "USD"
                          }
                        ],

                        // shipping address is not required though
                        "shipping_address": {
                          "recipient_name": "Jane Foster",
                          "line1": "Travis County",
                          "line2": "",
                          "city": "Austin",
                          "country_code": "US",
                          "postal_code": "73301",
                          "phone": "+00000000",
                          "state": "Texas"
                        },
                      }
                    }
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    print("onSuccess: $params");
                  },
                  onError: (error) {
                    print("onError: $error");
                  },
                  onCancel: (params) {
                    print('cancelled: $params');
                  }),
            ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff058EF7),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pagar con ',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              const Text(
                'PayPal',
                style: TextStyle(
                  fontFamily: 'Verdana',
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
