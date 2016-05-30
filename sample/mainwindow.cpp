/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 David Krepsky
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#include "mainwindow.h++"
#include "ui_mainwindow.h"
#include <qmaterialicons.h++>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), ui(new Ui::MainWindow) {
  ui->setupUi(this);

  // Load QMaterialIcon library.
  QMaterialIcon::load();

  // Add an icon to a label and change its color and size with a stylesheet.
  ui->label->setFont(QMaterialIcon::getFont());
  ui->label->setText(QChar(mi::face));
  ui->label->setFixedSize(30, 30);
  ui->label->setStyleSheet("color:red;font-size:30px;");

  // Add a pixmap to a label.
  ui->label_2->setFixedSize(30, 30);
  ui->label_2->setPixmap(
  QMaterialIcon::getPixmap(mi::access_time, Qt::gray, 30));

  // Add an icon to a button.
  ui->pushButton->setFixedSize(30, 30);
  ui->pushButton->setIcon(QMaterialIcon::getIcon(mi::menu, Qt::green, 30));
}

MainWindow::~MainWindow() {
  delete ui;
}
