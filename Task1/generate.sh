MODULE_SRC=Modules/Networking/Sources/Networking
openapi-generator generate -i recipepuppy.yaml -g swift5 -o api-mobile
rm -r $MODULE_SRC""*
cp -R api-mobile/OpenAPIClient/Classes/OpenAPIs/. $MODULE_SRC
rm -r api-mobile
