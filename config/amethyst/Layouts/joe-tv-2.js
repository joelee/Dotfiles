function layout() {
    return {
        name: "Joseph TV Test 2",
        initialState: {
            mainPaneCount: 2,
            mainPaneRatio: 0.6,
            firstPaneRatio: 0.5
        },
        commands: {
            command3: {
                description: "Decrease main pane ratio", // 0.38 to 0.82 (-0.02)
                updateState: (state) => {
                    return { ...state, mainPaneRatio: state.mainPaneRatio < 0.38 ? 0.38 : state.mainPaneRatio - 0.02 };
                }
            },
            command4: {
                description: "Increase main pane ratio", // 0.38 to 0.82 (+0.02)
                updateState: (state) => {
                    return { ...state, mainPaneRatio: state.mainPaneRatio > 0.82 ? 0.82 : state.mainPaneRatio + 0.02 };
                }
            },
            command1: {
                description: "Decrease first pane ratio", // 0.2 to 0.9 (-0.02)
                updateState: (state) => {
                    let mainPaneCount = state.mainPaneCount;
                    if (mainPaneCount == 0) {
                        return { ...state, mainPaneCount: 2, firstPaneRatio: 0.8 };
                    } else if (state.firstPaneRatio <= 0.80) {
                        mainPaneCount = 2;
                    }
                    return { ...state, firstPaneRatio: state.firstPaneRatio <= 0.2 ? 0.2 : state.firstPaneRatio -= 0.02, mainPaneCount: mainPaneCount };
                }
            },
            command2: {
                description: "Increase first pane ratio",  // 0.2 to 0.0 (+0.02)
                updateState: (state) => {
                    let mainPaneCount = state.mainPaneCount;
                    if (state.firstPaneRatio >= 0.9) {
                        mainPaneCount = 0;
                    } else {
                        mainPaneCount = 2;
                    }
                    return { ...state, firstPaneRatio: state.firstPaneRatio >= 0.9 ? 0.9 : state.firstPaneRatio += 0.02, mainPaneCount: mainPaneCount };
                }
            }
        },
        getFrameAssignments: (windows, screenFrame, state) => {
            const mainPaneCount = Math.min(state.mainPaneCount || 1, windows.length);
            const secondaryPaneCount = Math.min(4, windows.length - mainPaneCount);
            const hasSecondaryPane = secondaryPaneCount > 0;

            const firstPaneWindowWidth = Math.round(screenFrame.width * state.firstPaneRatio);
            const mainPaneWindowHeight = Math.round(screenFrame.height * state.mainPaneRatio);
            const secondaryPaneWindowHeight = Math.round(screenFrame.height * (1 - state.mainPaneRatio));

            return windows.reduce((frames, window, index) => {
                const isMain = index < mainPaneCount;
                let frame;

                // Process Main Pane
                if (isMain) {
                    if (mainPaneCount < 2) {
                        frame = {
                            x: screenFrame.x,
                            y: screenFrame.y + secondaryPaneWindowHeight,
                            width: screenFrame.width,
                            height: mainPaneWindowHeight
                        };
                    } else {
                        const s_block = screenFrame.width - firstPaneWindowWidth;
                        if (index == 0) {
                            frame = {
                                x: screenFrame.x,
                                y: screenFrame.y + secondaryPaneWindowHeight,
                                width: firstPaneWindowWidth,
                                height: mainPaneWindowHeight
                            };
                        } else {
                            frame = {
                                x: screenFrame.x + firstPaneWindowWidth,
                                y: screenFrame.y + secondaryPaneWindowHeight,
                                width: s_block,
                                height: mainPaneWindowHeight
                            };
                        }
                    }

                // Process Second Pane
                } else if (hasSecondaryPane) {
                    const secondaryPaneIndex = index - mainPaneCount
                    if (secondaryPaneIndex < 4) {
                        const secondaryPaneRatio = secondaryPaneCount <= 3 ? 3 : 4;
                        const secondaryPaneWindowWidth = screenFrame.width / secondaryPaneRatio;
                        frame = {
                            x: screenFrame.x + (secondaryPaneWindowWidth * Math.min(4, secondaryPaneIndex)),
                            y: screenFrame.y,
                            width: secondaryPaneWindowWidth,
                            height: secondaryPaneWindowHeight
                        }
                    } else {
                        const u_width = screenFrame.width / 5
                        const u_height = screenFrame.height / 3
                        frame = {

                            x: screenFrame.x + u_width,
                            y: screenFrame.y + u_height,
                            width: u_width * 3,
                            height: u_height * 2
                        }
                    }
                }
                return { ...frames, [window.id]: frame };
            }, {});
        }
    };
}
