import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/create/create_controller.dart';

class CreatePage extends GetWidget<CreateController> {
  var controller = Get.put(CreateController());
  var ICON = 'icon';
  var NAME = 'name';
  var PRICE = 'price';
  var DESCRIPTION = 'description';
  var _txtIconController = TextEditingController();
  var _txtNameController = TextEditingController();
  var _txtPriceController = TextEditingController();
  var _txtDescriptionController = TextEditingController();

  inputTypeController(TYPE) {
    if (TYPE == ICON) {
      return _txtIconController;
    } else if (TYPE == NAME) {
      return _txtNameController;
    } else if (TYPE == PRICE) {
      return _txtPriceController;
    } else if (TYPE == DESCRIPTION) {
      return _txtDescriptionController;
    }
  }

  inputLabelText(TYPE) {
    if (TYPE == ICON) {
      return 'Nhập Icon';
    } else if (TYPE == NAME) {
      return 'Nhập tên loại chi tiêu';
    } else if (TYPE == PRICE) {
      return 'Nhập số tiền chi tiêu';
    } else if (TYPE == DESCRIPTION){
      return 'Nhập mô tả';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text('Thêm chi tiêu mới')),
            body: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  height: Get.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // renderInput(ICON),
                      // const SizedBox(height: 10),
                      renderInput(NAME),
                      const SizedBox(height: 10),
                      renderInput(DESCRIPTION),
                      const SizedBox(height: 10),
                      renderInput(PRICE),
                      const SizedBox(height: 10),
                      renderButtonSave()
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget renderInput(TYPE) {
    return SizedBox(
      width: Get.width * 0.9,
      height: Get.height * 0.08,
      child: TextField(
        controller: inputTypeController(TYPE),
        keyboardType: TYPE == PRICE ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            )),
            labelText: inputLabelText(TYPE),
            labelStyle: const TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget renderButtonSave() {
    return ElevatedButton(
        onPressed: () {
          controller.save('null', _txtNameController.text,_txtDescriptionController.text,
              _txtPriceController.text);
        },
        child: const Text('Lưu lại'));
  }
}
