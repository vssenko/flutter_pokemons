import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import '../utils//styles/styles.dart';

const dots = '...';

int substractOne(int current) {
  if (current < 1) {
    return 0;
  }
  return current - 1;
}

int addOne(current, total) {
  if (current == total) {
    return current;
  }

  return current + 1;
}

List<String> buildPaginationValues(
    {required int totalPages, required int currentPage}) {
  List<String> items = [];
  if (totalPages == 0) {
    return [];
  }
  var prev1 = substractOne(currentPage);
  var prev2 = substractOne(prev1);
  if (prev2 > 0) {
    items.add('0');
  }
  if (prev2 > 1) {
    items.add('1');
  }
  if (prev2 > 2) {
    items.add(dots);
  }
  if (prev2 != currentPage) {
    items.add(prev2.toString());
  }
  if (prev1 != prev2) {
    items.add(prev1.toString());
  }
  items.add(currentPage.toString());
  var next1 = addOne(currentPage, totalPages);
  var next2 = addOne(next1, totalPages);
  if (next1 != currentPage) {
    items.add(next1.toString());
  }
  if (next2 != next1) {
    items.add(next2.toString());
  }
  if (next2 < totalPages - 2) {
    items.add(dots);
    items.add((totalPages - 1).toString());
    items.add(totalPages.toString());
  }
  return items;
}

class Paginator extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final Function(int)? onChange;
  const Paginator(
      {Key? key,
      required this.totalPages,
      required this.currentPage,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pages =
        buildPaginationValues(currentPage: currentPage, totalPages: totalPages);
    List<Widget> widgets = pages.map((String num) {
      bool isDots = num == dots;
      bool isActive = num == currentPage.toString();
      return PageNumber(
          isActive: isActive,
          number: num,
          onClick: isDots
              ? null
              : (num) {
                  if (onChange != null) {
                    onChange!(num);
                  }
                });
    }).toList();

    return Row(
      children: widgets,
    );
  }
}

class PageNumber extends StatelessWidget {
  final String number;
  final Function(int)? onClick;
  final bool isActive;
  const PageNumber(
      {this.onClick, required this.number, required this.isActive, Key? key})
      : super(key: key);

  _onNumberClick() {
    if (onClick != null && number != dots) {
      onClick!(int.parse(number));
    }
  }

  @override
  Widget build(BuildContext context) {
    var styles = Styles(context);

    var backColor = isActive == true
        ? styles.colorStyles.pokemonYellowColor
        : styles.colorStyles.pokemonRedColor;
    var textColor = isActive == true ? Colors.black : Colors.white;

    var allContent = Container(
      width: Dimensions.getPercentWidth(context, 8),
      height: Dimensions.getPercentWidth(context, 8),
      color: backColor,
      alignment: Alignment.center,
      child: Text(
        number.toString(),
        style: TextStyle(color: textColor),
      ),
    );
    if (number == dots) {
      return allContent;
    }

    return InkWell(
      onTap: () {
        _onNumberClick();
      },
      child: IgnorePointer(child: allContent),
    );
  }
}
