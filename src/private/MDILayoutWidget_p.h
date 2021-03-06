/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2020-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/



#ifndef KDDOCKWIDGETS_MDI_LAYOUT_WIDGET_P_H
#define KDDOCKWIDGETS_MDI_LAYOUT_WIDGET_P_H

#include "LayoutWidget_p.h"
#include "kddockwidgets/KDDockWidgets.h"
#include "kddockwidgets/docks_export.h"

namespace Layouting {
class ItemFreeContainer;
}

namespace KDDockWidgets {

/**
 * @brief The MDILayoutWidget class implements a layout suitable for MDI style docking.
 * Where dock widgets are free to be positioned in arbitrary positions, not restricted by layouting.
 */
class DOCKS_EXPORT MDILayoutWidget : public LayoutWidget
{
    Q_OBJECT
public:
    explicit MDILayoutWidget(QWidgetOrQuick *parent = nullptr);
    ~MDILayoutWidget() override;

    /// @brief docks the dock widgets into this MDI area, at the specified position
    void addDockWidget(DockWidgetBase *dw, QPoint localPt);

private:
    Layouting::ItemFreeContainer *const m_rootItem;
};

}

#endif
